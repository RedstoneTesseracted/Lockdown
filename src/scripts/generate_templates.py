"""
This script is used to generate various advancement/loot table en-masse.
It uses the contents of ./templates and data from several .json files to fill out said templates.
"""
from json import load, loads, dump
import os
from os import path



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
            if 'lockdown.channel.no_channel' in lore_data[0]:
                return_code = 0

            elif 'lockdown.code.no_code' in lore_data[0]:
                return_code = 1

            else:
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


def main():
    os.chdir(path.split(__file__)[0])
    generate_item_advancements()
    generate_items()
    generate_item_modifiers()
    generate_universal_destroyer()
    generate_code_channel_string_identifier()
    generate_beam_models()


if __name__ == "__main__":
    main()
