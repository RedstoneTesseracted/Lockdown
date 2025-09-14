"""
This script is used to generate various advancement/loot table en-masse.
It uses the contents of ./templates and data from several .json files to fill out said templates.

Be warned, there's some
   _____                   __         __  __  _
  / ___/____  ____ _____ _/ /_  ___  / /_/ /_(_)
  \__ \/ __ \/ __ `/ __ `/ __ \/ _ \/ __/ __/ /
 ___/ / /_/ / /_/ / /_/ / / / /  __/ /_/ /_/ /
/____/ .___/\__,_/\__, /_/ /_/\___/\__/\__/_/
    /_/          /____/

"""
from json import load, loads, dump
import os
from os import path
import nbtlib
from nbtlib import String, Compound
import re
from typing import Union
import random


def recursive_key_find(searchable: Union[dict, list], search_key: str) -> list:
    """
    Recursively searches for all entries with the given key within a nested dictionary/list.

    Arguments:
        searchable (Union[dict, list]): Nested list/dictionary to search
        search_key (str): Key to search for

    Returns:
        (list): List of all values found for a key 
    """
    result = []

    if hasattr(searchable, 'items'):
        for key, value in searchable.items():
            if key == search_key:
                result.append(value)
            else:
                result += recursive_key_find(value, search_key)

    elif hasattr(searchable, '__iter__'):
        for entry in searchable:
            if entry is searchable: continue
            result += recursive_key_find(entry, search_key)
    
    return result


def json_to_nbt(convertable) -> Compound:
    """
    Converts the JSON-compatible object to an NBT object

    Arguments:
        convertable: JSON-compatible dictionary to convert

    Returns:
        (Compound): Converted NBT object
    """
    if isinstance(convertable, int):
        if -2**31 < convertable < 2**31-1:
            return nbtlib.Int(convertable)
        else:
            return nbtlib.Long(convertable)

    elif isinstance(convertable, str):
        return String(convertable)

    elif isinstance(convertable, float):
        return nbtlib.Float(convertable)

    elif isinstance(convertable, bool):
        return nbtlib.Byte(convertable)

    elif isinstance(convertable, dict):
        result = Compound()
        for key, value in convertable.items():
            result[key] = json_to_nbt(value)
        return result

    elif isinstance(convertable, list) or isinstance(convertable, tuple):
        return nbtlib.List([json_to_nbt(i) for i in convertable])

    else:
        raise TypeError(f"Unhandled data type '{type(convertable)}' when converting to NBT")


def same_unzipped_nbt(nbt_data: Compound, file_path: str) -> bool:
    """
    Checks whether the unzipped NBT data in the target file is identical to the provided compound.
    This is used to avoid updating files whose only difference is in the gzip header.

    Arguments:
        nbt_data (Compound): NBT compound to be checked
        file_path (str): Path to gzipped NBT file to compare against

    Returns:
        (bool): Whether the actual, non-gzipped NBT contents are identical
    """
    file_nbt = nbtlib.load(file_path, gzipped=True)
    return nbt_data.snbt() == file_nbt.snbt()


def safe_nbt_save(nbt_data: Compound, file_path: str):
    """
    Saves NBT data to a gzip-compressed file.  If the file's contents already match the provided NBT data, the file will not be written (even to update the gzip header)

    Arguments:
        nbt_data (Compound): NBT compound to save
        file_path (str): Path to file
    """
    if not path.exists(file_path) or not same_unzipped_nbt(nbt_data, file_path):
        nbtlib.File(nbt_data, gzipped=True).save(file_path)


def read_snbt(file_path: str) -> Compound:
    """
    Reads and parsed snbt data from a file

    Arguments:
        file_path (str): Path to file

    Returns:
        (Compound): Parsed NBT data
    """
    with open(file_path, mode='r') as rf:
        snbt_data = rf.read()
    return nbtlib.parse_nbt(snbt_data)


def generate_item_advancements():
    """
    Generate all the item-related advancements under the advancements/lockdown folder
    """
    with open("item_advancements.json", mode='r') as rf:
        advancements = load(rf)
    
    with open(path.join('templates', 'advancement_template.json'), mode='r') as rf:
        raw_template = rf.read()
    
    with open(path.join('..', 'Resource-Pack', 'Lockdown', 'assets', 'minecraft', 'lang', 'en_us.json'), mode='r') as rf:
        en_lang = load(rf)
    
    for name, advancement in advancements.items():
        item_model = advancement['item']
        title = advancement.get('title', f"advancement.lockdown.{name}.title")
        description = advancement.get('description', f"advancement.lockdown.{name}.description")
        parent = advancement.get('parent', "lockdown:lockdown/root")
        condition = advancement['condition']
        frame = advancement.get('frame', 'task')
        hidden = advancement.get('hidden')

        template = loads(raw_template)
        template['display']['icon']['components']['minecraft:item_model'] = item_model
        template['display']['title']['translate'] = title
        template['display']['title']['fallback'] = en_lang[title]
        template['display']['description']['translate'] = description
        template['display']['description']['fallback'] = en_lang[description]
        template['display']['frame'] = frame
        if hidden is True: template['display']['hidden'] = True
        template['parent'] = parent
        template['criteria'][name] = template['criteria']['placeholder']
        template['criteria'].pop('placeholder')
        template['criteria'][name]['conditions']['items'][0]['predicates']['minecraft:custom_data']['lockdown_data'] = condition

        with open(path.join('..', 'Data-Pack', 'Lockdown', 'data', 'lockdown', 'advancement', 'lockdown', name + '.json'), mode='w') as wf:
            dump(template, wf, indent=4)


def generate_items():
    """
    Substitutes item definitions into all places that need to have the correct item components.
    The recipe outputs under Lockdown/data/recipe/ are treated as the canonical definitions.
    """
    with open(path.join('templates', 'item_loot_table_template.json'), mode='r') as rf:
        raw_template = rf.read()

    datapack_dir = path.join(path.pardir, 'Data-Pack', 'Lockdown', 'data', 'lockdown')
    recipe_dir = path.join(datapack_dir, 'recipe')
    loot_table_dir = path.join(datapack_dir, 'loot_table', 'item')
    for dirpath, dirnames, filenames in os.walk(recipe_dir):
        for file in filenames:
            # Skip non-JSON files
            if path.splitext(file)[1] != '.json':
                continue

            # Extract item components from recipe output
            with open(path.join(dirpath, file), mode='r') as rf:
                data = load(rf)
            base_id = data['result']['id']

            # Generate loot table that gives item
            item_modifier_path = path.join(dirpath.removeprefix(recipe_dir).removeprefix(path.sep), file)
            item_modifier = 'lockdown:item/' + '/'.join(path.splitext(item_modifier_path)[0].split(path.sep))
            template = loads(raw_template)
            template['pools'][0]["entries"][0]['name'] = base_id
            template['pools'][0]["entries"][0]['functions'][0]['name'] = item_modifier

            # Save to file.  Create parent directory if needed
            loot_table_path = path.join(loot_table_dir, dirpath.removeprefix(recipe_dir).removeprefix(path.sep))
            if not path.exists(loot_table_path):
                os.mkdir(loot_table_path)
            with open(path.join(loot_table_path, file), mode='w') as wf:
                dump(template, wf, indent=4)


def generate_item_modifiers():
    """
    Generates all item modifiers used to set the components for a lockdown item.
    The recipe outputs under Lockdown/data/recipe/ are treated as the canonical definitions.
    """
    with open(path.join('templates', 'item_modifier_template.json'), mode='r') as rf:
        raw_template = rf.read()

    datapack_dir = path.join(path.pardir, 'Data-Pack', 'Lockdown', 'data', 'lockdown')
    recipe_dir = path.join(datapack_dir, 'recipe')
    item_modifier_dir = path.join(datapack_dir, 'item_modifier', 'item')
    for dirpath, dirnames, filenames in os.walk(recipe_dir):
        for file in filenames:
            # Skip non-JSON files
            if path.splitext(file)[1] != '.json':
                continue

            # Extract item components from recipe output
            with open(path.join(dirpath, file), mode='r') as rf:
                data = load(rf)
            base_id = data['result']['id']
            components = data['result']['components']

            # Generate loot table that gives item
            components['minecraft:custom_data']['lockdown_data']['configure'] = True
            template = loads(raw_template)
            template[0]['components'] = components
            template[1]['item'] = base_id

            # Save to file.  Create parent directory if needed
            item_modifier_path = path.join(item_modifier_dir, dirpath.removeprefix(recipe_dir).removeprefix(path.sep))
            if not path.exists(item_modifier_path):
                os.mkdir(item_modifier_path)
            with open(path.join(item_modifier_path, file), mode='w') as wf:
                dump(template, wf, indent=4)


def generate_universal_destroyer():
    """
    Generates a function that can destroy any lockdown custom block/entity.
    This is achieved by scanning all directories under functions/devices/
    for the presence of a "destroy" function.
    """
    datapack_dir = path.join(path.pardir, 'Data-Pack', 'Lockdown', 'data', 'lockdown')
    devices_dir = path.join(datapack_dir, 'function', 'devices')

    with open(path.join(devices_dir, 'universal_destroy.mcfunction'), mode='w') as wf:
        # Write header
        wf.write("""\
# This function is capable of destroying any custom lockdown block/entity.
# It works by running the corresponding block destruction function that
# matches whatever this entity is.
# This is run BY and AT the root block entity
# WARNING: THIS IS AUTO-GENERATED USING A SCRIPT

""")

        # Check for all custom blocks with a "destroy" function
        for directory in os.listdir(devices_dir):
            full_path = path.join(devices_dir, directory)
            if not path.isdir(full_path): continue
            if not path.exists(path.join(full_path, 'destroy.mcfunction')): continue
            wf.write(f'execute if entity @s[tag=lockdown.{directory}] run return run function lockdown:devices/{directory}/destroy\n')


def generate_code_channel_string_identifier():
    """
    This generates the function that is used to determine whether
    encoded items should receive the "Code Assigned" lore string or the
    "Channel Assigned" lore string.  This is achieve by checking the item's
    recipe for either "No Code Assigned" or "No Channel Assigned"
    """
    by_group = {}
    by_name = {}
    
    datapack_dir = path.join(path.pardir, 'Data-Pack', 'Lockdown', 'data', 'lockdown')
    recipe_dir = path.join(datapack_dir, 'recipe')
    function_dir = path.join(datapack_dir, 'function')
    for dirpath, dirnames, filenames in os.walk(recipe_dir):
        for file in filenames:
            # Skip non-JSON files
            if path.splitext(file)[1] != '.json':
                continue

            # Extract item components from recipe output
            with open(path.join(dirpath, file), mode='r') as rf:
                data = load(rf)
            components = data['result']['components']
            lockdown_data = components.get('minecraft:custom_data', {}).get('lockdown_data', {})
            lore_data = components.get('minecraft:lore', [''])

            # Skip non-encodable items
            if not lockdown_data.get('encodable'):
                continue

            # Determine whether this should say "code" or "channel"
            return_code = None
            for lore_line in lore_data:
                #if not isinstance(lore_line, dict): continue
                if lore_line.get('translate') == 'item.lockdown.channel.no_channel':
                    return_code = 0
                    break
                elif lore_line.get('translate') == 'item.lockdown.code.no_code':
                    return_code = 1
                    break

            if return_code is None:
                continue

            # Determine whether this is by group or by name
            if 'group' in lockdown_data:
                by_group[lockdown_data['group']] = return_code

            elif 'name' in lockdown_data:
                by_name[lockdown_data['name']] = return_code

            else:
                continue
    
    # Write function file
    with open(path.join(function_dir, 'devices', 'encoder', 'determine_lore.mcfunction'), mode='w') as wf:
        wf.write("""\
# Identifies whether an encoded item should say "channel" or "code"
# in its lore.  This function is auto-generated using a script that
# bases its results off of the defined recipes.
# 0 = "channel"
# 1 = "code"

# By item group
""")
        for group, return_code in by_group.items():
            wf.write(f'execute if items block ~ ~ ~ container.4 *[minecraft:custom_data~{{lockdown_data:{{group:"{group}"}}}}] run return {return_code}\n')

        wf.write("\n# By item name\n")
        for name, return_code in by_name.items():
            wf.write(f'execute if items block ~ ~ ~ container.4 *[minecraft:custom_data~{{lockdown_data:{{name:"{name}"}}}}] run return {return_code}\n')

        wf.write("""
# Default case
return 0
""")



def generate_beam_models():
    """
    Generates the rescaled beam models and master item model definition.
    This is used to compensate for the scaling transform on beam displays
    having to be the same in all directions due to a fixed transformation
    order.
    Because of *course* you'd need to compensate for that...
    """
    # Declare paths used below
    resourcepack_dir = path.join(path.pardir, 'Resource-Pack', 'Lockdown', 'assets', 'lockdown')
    beam_models_dir = path.join(resourcepack_dir, 'models', 'item', 'beams')
    items_dir = path.join(resourcepack_dir, 'items')

    # Create beam models directory if it doesn't already exist
    if not path.exists(beam_models_dir):
        os.mkdir(beam_models_dir)

    # Set up item model state
    item_model_def = {
        "model": {
            "type": "minecraft:select",
            "property": "minecraft:custom_model_data",
            "index": 0,
            "fallback": {
                "type": "minecraft:empty"
            },
            "cases": []
        }
    }

    # Load template model
    with open(path.join('templates', 'laser_beam_template.json'), mode='r') as rf:
        raw_template = rf.read()

    # Generate all item models (all scales & directions)
    MAX_DIST = 10.0
    INCREMENT = 0.5
    DIRECTIONS = {
        'north': (90.0, 0.0, 0.0),
        'south': (-90.0, 0.0, 0.0),
        'unset': (0.0, 0.0, 0.0)
    }
    for direction, rotation in DIRECTIONS.items():
        # Prepare range dispatch for this direction
        sub_item_model_def = {
            "model": {
                "type": "minecraft:range_dispatch",
                "property": "minecraft:custom_model_data",
                "scale": 1.0,
                "fallback": {
                    "type": "minecraft:empty"
                },
                "entries": []
            }
        }

        # Create sub-folder for this direction if it doesn't already exist
        direction_specific_dir = path.join(beam_models_dir, direction)
        if not path.exists(direction_specific_dir):
            os.mkdir(direction_specific_dir)

        # Generate all lengths
        c = 0.0
        while c < MAX_DIST:
            c += INCREMENT
            model_name = f'beam_{round(10*c)}'
            model = loads(raw_template)
            model['display']['head']['scale'][0] = 0.9/c
            model['display']['head']['scale'][1] = 0.9/c
            model['display']['head']['rotation'] = rotation
            sub_item_model_def['model']['entries'].append({"threshold": c, "model": {"type":"minecraft:model", "model": f"lockdown:item/beams/{direction}/{model_name}"}})
            with open(path.join(direction_specific_dir, model_name + '.json'), mode='w') as wf:
                dump(model, wf, indent=4)

        # Add sub-item model definition to the full one
        if direction == 'unset':
            item_model_def['model']['fallback'] = sub_item_model_def['model']
        else:
            sub_item_model_def['when'] = direction
            item_model_def['model']['cases'].append(sub_item_model_def)

    # Generate items model definition
    with open(path.join(items_dir, 'turret_beam.json'), mode='w') as wf:
        dump(item_model_def, wf, indent=4)


def generate_grouped_loot_tables():
    """
    Generates a loot tables for various groups of items
    """
    # Declare paths used below
    datapack_dir = path.join(path.pardir, 'Data-Pack', 'Lockdown', 'data', 'lockdown')
    loot_table_dir = path.join(datapack_dir, 'loot_table')
    item_loot_table_dir = path.join(loot_table_dir, 'item')

    # This set is used as a sanity check to ensure we don't miss any items
    accounted_for = set()

    def add_reference(loot_table, reference):
        loot_table['pools'].append({
            "rolls": 1,
            "entries": [
                {
                    "type": "minecraft:loot_table",
                    "value": reference.removesuffix('.json')
                }
            ]
        })

    def classify_loot_table(loot_table):
        # Upgrades end with "_upgrade.json"
        if loot_table.endswith("_upgrade.json"):
            return 'upgrade'

        # Anything else we need to open and check
        with open(loot_table, mode='r') as rf:
            data = load(rf)
        try:
            entry = data['pools'][0]['entries'][0]
            if entry['type'] != 'minecraft:item': return 'other'
            if entry['name'] in ('minecraft:item_frame', 'minecraft:pig_spawn_egg'):
                return 'placeable'
            else:
                return 'item'
        except (KeyError, TypeError):
            return 'other'

    # Generate grouped loot tables for alarms, buttons, and keycards
    explicit_groups = ('alarm', 'button', 'keycard')
    for group in explicit_groups:
        result = {'pools': []}
        for entry in os.listdir(path.join(item_loot_table_dir, group)):
            if path.splitext(entry)[-1] != '.json': continue
            accounted_for.add(path.join(group, entry))
            add_reference(result, f"lockdown:item/{group}/{entry}")

        # Write the loot table for this group
        with open(path.join(loot_table_dir, 'cheat', group.removesuffix('s') + 's.json'), mode='w') as wf:
            dump(result, wf, indent=4)

    # Generate loot table for other groups:
    #   * Upgrades
    #   * Placeable miscellaneous items (machines)
    #   * Non-placeable miscellaneous items (tools)
    upgrades = {'pools': []}
    machines = {'pools': []}
    tools = {'pools': []}
    for dirpath, dirnames, filenames in os.walk(item_loot_table_dir):
        subdir = dirpath.removeprefix(item_loot_table_dir).removeprefix(path.sep)
        if subdir in explicit_groups: continue
        for file in filenames:
            if path.splitext(file)[-1] != '.json': continue
            loot_table = 'lockdown:' + path.join('item', subdir, file.removesuffix('.json')).replace(path.sep, '/')
            accounted_for.add(path.join(subdir, file))

            # Loot tables related to upgrades end in "_upgrade"
            loot_table_type = classify_loot_table(path.join(dirpath, file))
            match loot_table_type:
                case 'upgrade':
                    add_reference(upgrades, loot_table)
                case 'placeable':
                    add_reference(machines, loot_table)
                case 'item':
                    add_reference(tools, loot_table)
                case 'other':
                    pass

    with open(path.join(loot_table_dir, 'cheat', 'upgrades.json'), mode='w') as wf:
        dump(upgrades, wf, indent=4)

    with open(path.join(loot_table_dir, 'cheat', 'machines.json'), mode='w') as wf:
        dump(machines, wf, indent=4)

    with open(path.join(loot_table_dir, 'cheat', 'tools.json'), mode='w') as wf:
        dump(tools, wf, indent=4)

    # Make sure we didn't miss anything
    for dirpath, dirnames, filenames in os.walk(item_loot_table_dir):
        for file in filenames:
            relative_path = path.join(dirpath.removeprefix(item_loot_table_dir).removeprefix(path.sep), file)
            assert relative_path in accounted_for, f'{relative_path} missing from list of accounted-for files'
    

def generate_placer_tests():
    """
    Generates the structure files and test instance definitions for all placer tests.
    
    * lockdown:place_block/placer is checked to determine which devices need tests.
    * lockdown:place_block/place/* are scanned to gather information about how device placement is processed.
    * The recipes directory is scanned to obtain default entity data for placer entities.
    """
    # Declare paths used below
    datapack_dir = path.join(path.pardir, 'Data-Pack', 'Lockdown', 'data', 'lockdown')
    recipe_dir = path.join(datapack_dir, 'recipe')
    function_dir = path.join(datapack_dir, 'function')
    test_structure_dir = path.join(datapack_dir, 'structure', 'test')
    test_instance_dir = path.join(datapack_dir, 'test_instance')

    
    def placer_from_template(device: str, properties: dict):
        """
        Builds a device placer test structure

        Arguments:
            device (str): Name of device to be substituted into command blocks
            properties (dict): Device properties table
        """
        # Choose which base structure to use and load it
        if properties['channels']:
            source_file = 'templates/placer_test_channel.snbt'
        else:
            source_file = 'templates/placer_test_basic.snbt'

        template = read_snbt(source_file)

        # Randomly pick a channel ID (even if it's not actually needed).
        # Channels are chosen from the range [4096, 2147483647].  This is deliberately chosen
        # to prevent conflicts with channels that could naturally exist within the world.
        # Additionally, the device name is used as the seed to ensure consistency between
        # subsequent runs.
        random.seed(device)
        channel = str(random.randint(4096, 2147483647))
        
        # Build the snbt of the summoned placer entity
        summoned_nbt = json_to_nbt(properties['entity_data'])
        if properties['channels']:
            if properties['entity'] == 'minecraft:marker':
                summoned_nbt['data']['lockdown_data']['channel'] = nbtlib.Int(channel)
            elif properties['entity'] == 'minecraft:item_frame':
                summoned_nbt['Item']['components']['minecraft:custom_data']['lockdown_data']['channel'] = nbtlib.Int(channel)

        if properties['entity'] == 'minecraft:item_frame':
            summoned_nbt['Facing'] = nbtlib.Byte(1)

        # Replace templated strings in structure
        for i, block in enumerate(template['blocks']):
            command = block.get('nbt', {}).get('Command')
            if command is None: continue
            command = command.replace('<<T:DEVICE>>', device)
            command = command.replace('<<T:BASE BLOCK>>', properties['block'])
            if '<<T:SUMMON PLACER>>' in command:
                command = f'/summon {properties["entity"]} ~1 ~ ~ ' + summoned_nbt.snbt()
            
            command = command.replace('<<T:CHANNEL>>', channel)
            block['nbt']['Command'] = String(command)
        return template

    def obstruct_from_template(device: str, properties: dict):
        """
        Builds a device obstructed placement test structure

        Arguments:
            device (str): Name of device to be substituted into command blocks
            properties (dict): Device properties table
        """
        # Allowed placement rules:
        #   requires_channel
        #   nonsolid_entity_placement
        #   solid_block_placement
        #   control_tower_special (ignored, handle manually)
        template = read_snbt('templates/obstruct_test.snbt')

        # Randomly pick channel ID using same rules from placer_from_template
        random.seed(device)
        channel = str(random.randint(4096, 2147483647))
        
        # Build the snbt of the summoned placer entity
        summoned_nbt_channelless = json_to_nbt(properties['entity_data'])
        summoned_nbt = json_to_nbt(properties['entity_data'])
        if properties['channels']:
            if properties['entity'] == 'minecraft:marker':
                summoned_nbt['data']['lockdown_data']['channel'] = nbtlib.Int(channel)
            elif properties['entity'] == 'minecraft:item_frame':
                summoned_nbt['Item']['components']['minecraft:custom_data']['lockdown_data']['channel'] = nbtlib.Int(channel)

        if properties['entity'] == 'minecraft:item_frame':
            summoned_nbt['Facing'] = nbtlib.Byte(1)
            summoned_nbt_channelless['Facing'] = nbtlib.Byte(1)

        # Build the snbt of the dropped item
        dropped_item_nbt_channelless = json_to_nbt(properties['item_data'])
        dropped_item_nbt = json_to_nbt(properties['item_data'])
        dropped_item_nbt['count'] = nbtlib.Int(1)
        dropped_item_nbt_channelless['count'] = nbtlib.Int(1)
        if properties['channels']:
            #dropped_item_nbt['components']['minecraft:custom_data']['lockdown_data']['channel'] = nbtlib.Int(channel)
            if properties['entity'] == 'minecraft:marker':
                dropped_item_nbt['components']['minecraft:entity_data']['data']['lockdown_data']['channel'] = nbtlib.Int(channel)
            elif properties['entity'] == 'minecraft:item_frame':
                dropped_item_nbt['components']['minecraft:entity_data']['Item']['components']['minecraft:custom_data']['lockdown_data']['channel'] = nbtlib.Int(channel)

        # Activate subtests according to placement rules.
        # We do this by replacing stained glass blocks with regular glass.
        # The glass blocks are then replaced with redstone blocks during
        # test execution.
        for block in template['palette']:
            if block['Name'] == 'minecraft:red_stained_glass' and 'requires_channel' in properties['placement_rules']:
                block['Name'] = String('minecraft:glass')
            if block['Name'] == 'minecraft:lime_stained_glass' and 'nonsolid_entity_placement' in properties['placement_rules']:
                block['Name'] = String('minecraft:glass')
            if block['Name'] == 'minecraft:yellow_stained_glass' and 'solid_block_placement' in properties['placement_rules']:
                block['Name'] = String('minecraft:glass')

        # Replace templated strings in structure
        for i, block in enumerate(template['blocks']):
            if 'nbt' not in block: continue

            # Handle command blocks
            if block['nbt']['id'] == 'minecraft:command_block':
                command = block['nbt']['Command']
                if command is None: continue
                command = command.replace('<<T:DEVICE>>', device)
                if '<<T:SUMMON PLACER>>' in command:
                    command = f'/summon {properties["entity"]} ~ ~ ~1 ' + summoned_nbt.snbt()
                if '<<T:SUMMON PLACER NO CHANNEL>>' in command:
                    command = f'/summon {properties["entity"]} ~ ~ ~1 ' + summoned_nbt_channelless.snbt()
                if '<<T:DROPPED ITEM CHECK>>' in command:
                    command = f'/execute positioned ~ ~0.5 ~-1 unless entity @e[distance=..1,type=minecraft:item,nbt={{Item:{dropped_item_nbt.snbt()}}}]'
                if '<<T:DROPPED ITEM CHECK NO CHANNEL>>' in command:
                    command = f'/execute positioned ~ ~0.5 ~-1 unless entity @e[distance=..1,type=minecraft:item,nbt={{Item:{dropped_item_nbt_channelless.snbt()}}}]'
                
                command = command.replace('<<T:CHANNEL>>', channel)
                block['nbt']['Command'] = String(command)

            # Handle test blocks
            if block['nbt']['id'] == 'minecraft:test_block':
                message = block['nbt']['message']
                message = message.replace('<<T:DEVICE>>', device)
                block['nbt']['message'] = String(message)
            
        return template
        


    # Parse lockdown:place_block/placer to determine which devices need tests
    devices = dict()
    with open(path.join(function_dir, 'place_block', 'placer.mcfunction'), mode='r') as rf:
        for line in rf.readlines():
            matched = re.match('^execute if entity @s\[tag=lockdown\.placer\.([a-z_]+)\] run function lockdown:place_block/place/[a-z_]+', line)
            if matched is None: continue
            device = matched.groups()[0]
            devices[device] = {
                'block': 'minecraft:air',
                'entity': 'unknown',
                'directions': 0,
                'channels': False,
                'colors': False,
                'extra_parts': [],
                'special': False,
                'placement_rules': []
            }

    # Use the info block header in the placer functions to obtain information about how each device is processed
    for file in os.listdir(path.join(function_dir, 'place_block', 'place')):
        device, ext = path.splitext(file)
        if ext != '.mcfunction': continue
        if device not in devices: continue

        # Each placer function contains a commented header listing information for us to parse here
        in_info_block = False
        with open(path.join(function_dir, 'place_block', 'place', file), mode='r') as rf:
            for line in rf.readlines():
                # Enter/exit header
                if line.startswith('##') and 'BEGIN INFO BLOCK' in line:
                    in_info_block = True
                elif line.startswith('##') and 'END INFO BLOCK' in line:
                    in_info_block = False
                    break

                # Parse header fields
                if in_info_block:
                    line = line.strip('#').strip()
                    if line.startswith('>'): continue
                    key, sep, value = line.partition(':')
                    if sep != ':': continue
                    # Reformat key (case-insenitive, underscores instead of spaces)
                    key = key.lower()
                    key = key.replace(' ', '_')
                    if key == 'solid': continue
                    
                    value = value.strip()
                    if key in devices[device]:
                        if key == 'extra_parts':
                            value = [i.strip() for i in value.split(',')]
                        elif key == 'placement_rules':
                            value = [i.strip() for i in value.split(',')]
                        elif type(devices[device][key]) == bool:
                            value = value.lower() == 'true'
                        else:
                            value = type(devices[device][key])(value)
                        devices[device][key] = value
                    else:
                        raise Exception(f"Unrecognized info block key: {key}")

    # There's a few devices whose name doesn't match the recipe name.
    # Additionally, big buttons and alarm lights come in multiple colors, and therefore
    # don't have a singular recipe.  For those cases, we'll just default to "red"
    recipe_to_device = dict((i, i) for i in devices.keys())
    recipe_to_device['encoding_station'] = 'encoder'
    recipe_to_device['red_button'] = 'big_button'
    recipe_to_device['red_alarm'] = 'alarm'
    
    # "found_recipe" is used as a sanity check to ensure we haven't missed the recipe for any placers
    # It's set here to prevent it from being writable above
    for device, properties in devices.items():
        properties['found_recipe'] = False

    # Scan recipes to obtain default item and entity data
    for dirpath, dirnames, filenames in os.walk(recipe_dir):
        for file in filenames:
            recipe_name = path.splitext(file)[0]
            
            if path.splitext(file)[-1] != '.json': continue   # Ignore non-JSON files
            if recipe_name not in recipe_to_device: continue  # Ignore recipes with no matching placer
            device = recipe_to_device[recipe_name]
            devices[device]['found_recipe'] = True
            
            with open(path.join(dirpath, file), mode='r') as rf:
                recipe = load(rf)

            # Convert JSON-formatted data to NBT format
            entity_data = recipe['result'].get('components', {}).get('minecraft:entity_data')
            if entity_data is None: continue
            entity_id = entity_data.pop('id')
            # Sanity check
            assert entity_id.partition(':')[-1] == devices[device]['entity'], f"Mismatched entity between info recipe and header for device \"{device}\" ({entity_id.partition(':')[-1]} != {devices[device]['entity']})"
            devices[device]['entity'] = entity_id
            devices[device]['entity_data'] = entity_data
            devices[device]['item_data'] = recipe['result']

    # Make sure recipes were found for ALL devices
    for device, properties in devices.items():
        assert properties['found_recipe'], f'No recipe was found for {device}'

    # Generate files for each placer unit test
    for device, properties in devices.items():
        # Generate appropriate structure files
        placer_nbt_data = placer_from_template(device, properties)
        obstruct_nbt_data = obstruct_from_template(device, properties)

        # Avoid updating structure files whose only difference is the "last updated" timestamp in the header
        safe_nbt_save(placer_nbt_data, path.join(test_structure_dir, 'placer', f'{device}.nbt'))
        safe_nbt_save(obstruct_nbt_data, path.join(test_structure_dir, 'obstruct', f'{device}.nbt'))
        
        # Generate test instance files for placement, obstructed placement, and destruction
        #for test in ('placer', 'obstruct', 'destroy'):
        for test in ('placer', 'obstruct'):
            test_instance = {
                "type": "block_based",
                "environment": "minecraft:default",
                "structure": f"lockdown:test/{test}/{device}",
                "max_attempts": 1,
                "max_ticks": 20,
                "sky_access": False,
                "manual_only": False,
                "required_successes": 1,
                "setup_ticks": 0,
                "rotation": "none",
                "required": True
            }
            with open(path.join(test_instance_dir, test, f'{device}.json'), mode='w') as wf:
                dump(test_instance, wf, indent=4)
            
            


def main():
    os.chdir(path.split(__file__)[0])
    generate_item_advancements()
    generate_items()
    generate_item_modifiers()
    generate_universal_destroyer()
    generate_code_channel_string_identifier()
    generate_beam_models()
    generate_grouped_loot_tables()
    generate_placer_tests()


if __name__ == "__main__":
    main()
