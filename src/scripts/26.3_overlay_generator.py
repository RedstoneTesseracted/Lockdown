"""
This script attempts to convert pre-26.3 JSON files to their 26.3 equivalent

Author: Redstone⁴
"""
import json
import os
from os import path
from copy import deepcopy
from typing import Union, Any, Generator


# Define constants
old_overlays = ['1.21.9', '1.21.11', '26.1', '26.2']
datapack_dir = path.join(path.pardir, 'Data-Pack', 'lockdown')
advancements_dir = path.join(datapack_dir, 'data', 'lockdown', 'advancement')
predicates_dir = path.join(datapack_dir, 'data', 'lockdown', 'predicate')
item_modifiers_dir = path.join(datapack_dir, 'data', 'lockdown', 'item_modifier')
loot_tables_dir = path.join(datapack_dir, 'data', 'lockdown', 'loot_table')
processor_list_dir = path.join(datapack_dir, 'data', 'lockdown', 'worldgen', 'processor_list')
new_dir = path.join(datapack_dir, '26.3')


def find_latest_version(file_path: str) -> str:
    """
    Some files are defined in multiple version overlays.  For the purposes of conversion, we want to use the latest, so this takes a path to a file in the standard data directory and returns a path to the most recent pre-26.3 overlay version.

    Arguments:
        file_path (str): Path to a file to search for a newer version of.

    Returns:
        (str): Path to the latest pre-26.3 overlay version of the given file.
    """
    most_recent = file_path
    for overlay in old_overlays:
        path.realpath(datapack_dir)
        overlay_path = path.join(datapack_dir, overlay, path.realpath(file_path).removeprefix(path.realpath(datapack_dir)).removeprefix(path.sep))
        if path.isfile(overlay_path):
            most_recent = overlay_path
    return most_recent


def is_in_sequence(sequence1: Union[list, tuple], sequence2: Union[list, tuple]) -> bool:
    """
    Returns whether sequence1 is present within sequence2
    """
    for i in range(len(sequence2)):
        if i + len(sequence1) > len(sequence2):
            break
        if all([entry == sequence2[i+j] for j, entry in enumerate(sequence1)]):
            return True
    return False


def recursive_key_sequence_find(object: Any, sequence: Union[list, tuple], parent_path: tuple = tuple(), level_above=False) -> list:
    """
    Recursively searches an object for a sequence of keys that matches the given pattern.
    A list of all found matches is returned.
    """
    result = []
    #print(parent_path, object)
    if isinstance(object, dict):
        for key, value in object.items():
            #print(parent_path, key, parent_path + (key,))
            if is_in_sequence(sequence, parent_path + (key,)):
                if level_above:
                    result.append(object)
                else:
                    result.append(value)
            #if key == 'criteria':
            #    print('='*40 + 'START' + '='*40)
            #    print(parent_path + (key,), value)
            result += recursive_key_sequence_find(value, sequence, parent_path=parent_path + (key,), level_above=level_above)
            #if key == 'criteria':
            #    print('='*40 + 'END' + '='*40)

    elif isinstance(object, list):
        for entry in object:
            result += recursive_key_sequence_find(entry, sequence, parent_path=tuple(), level_above=level_above)

    return result


def recursive_fix_condition_reference(object):
    """
    Recursively searches a JSON object for a reference-type condition and replaces it with the new string format
    """
    if isinstance(object, dict):
        # Check if reference and return new format if it is
        if object.get('condition', object.get('type', object.get('function'))) == 'minecraft:reference' and 'name' in object:
            return object['name']

        return dict((i, recursive_fix_condition_reference(j)) for i, j in object.items())

    elif isinstance(object, list):
        return [recursive_fix_condition_reference(i) for i in object]

    elif isinstance(object, tuple):
        return tuple([recursive_fix_condition_reference(i) for i in object])

    else:
        return object


def recursive_convert_condition_to_type(object):
    """
    Recursively converts "condition" keys to "type" keys
    """
    if isinstance(object, dict):
        if 'condition' in object and 'type' not in object:
            object['type'] = object.pop('condition')
        return dict((i, recursive_convert_condition_to_type(j)) for i, j in object.items())
    
    elif isinstance(object, list):
        return [recursive_convert_condition_to_type(i) for i in object]
    
    elif isinstance(object, tuple):
        return tuple([recursive_convert_condition_to_type(i) for i in object])
    
    else:
        return object


def fix_advancement_condition_reference(advancement: dict) -> bool:
    """
    Applies recursive_fix_condition_reference to an advancement definition in-place and returns whether the advancement was changed.
    """
    before = json.dumps(advancement)
    for key, value in recursive_fix_condition_reference(advancement).items():
        advancement[key] = value
    after = json.dumps(advancement)
    return before != after


def fix_advancement_convert_condition_to_type(advancement: dict) -> bool:
    """
    Applies recursive_convert_condition_to_type to an advancement definition in-place and returns whether the advancement was changed.
    """
    before = json.dumps(advancement)
    for key, value in recursive_convert_condition_to_type(advancement).items():
        advancement[key] = value
    after = json.dumps(advancement)
    return before != after


def fix_advancement_entity_condition(advancement: dict) -> bool:
    """
    Fixes an advancement in-place and returns whether any modification occurred
    """
    changed = False
    for matched in recursive_key_sequence_find(advancement, ('conditions', 'entity')):
        if not isinstance(matched, dict):
            continue
        # Make sure we can find a data structure in pre-26.3 format
        old_data = {}
        for key in tuple(matched.keys()):
            if key not in ['type', 'entity', 'predicate']:
                old_data[key] = matched.pop(key)
                changed = True
        matched['type'] = 'minecraft:entity_properties'
        matched['entity'] = 'this'
        matched['predicate'] = old_data
    return changed


def fix_advancement_player_list_condition(advancement: dict) -> bool:
    changed = False
    for matched in recursive_key_sequence_find(advancement, ('conditions', 'player'), level_above=True):
        player = matched['player'][0]
        assert len(matched['player']) == 1
        matched['player'] = player
        changed = True
    return changed


def fix_advancement_location_list_condition(advancement: dict) -> bool:
    changed = False
    for matched in recursive_key_sequence_find(advancement, ('conditions', 'location'), level_above=True):
        assert len(matched['location']) == 1
        player = matched['location'][0]
        matched['location'] = player
        changed = True
    return changed


def fix_advancement_block_state_property(advancement: dict) -> bool:
    changed = False
    for matched in recursive_key_sequence_find(advancement, ('conditions', 'location')):
        if not isinstance(matched, dict):
            continue
        if matched.get('type') != "minecraft:block_state_property":
            continue
        matched['type'] = "minecraft:match_block"
        matched['blocks'] = matched.pop('block')
        changed = True
    return changed


def fix_predicate_no_root_list(predicate: Union[dict, list]) -> dict:
    """
    Item modifiers are no longer allowed to list-type root objects
    """
    if isinstance(predicate, dict):
        return predicate

    elif isinstance(predicate, list):
        return {
            "type": "minecraft:all_of",
            "terms": predicate
        }

    else:
        raise ValueError(f"Unhandled type: {type(predicate)}")


def fix_item_modifier_no_root_list(item_modifier: Union[dict, list]) -> dict:
    """
    Item modifiers are no longer allowed to list-type root objects
    """
    if isinstance(item_modifier, dict):
        return item_modifier

    elif isinstance(item_modifier, list):
        return {
            "type": "minecraft:sequence",
            "functions": item_modifier
        }

    else:
        raise ValueError(f"Unhandled type: {type(item_modifier)}")


def fix_item_modifier_conditions(item_modifier: dict) -> dict:
    """
    The conditions format has changed between versions
    """
    if 'functions' in item_modifier:
        modifiers = item_modifier['functions']
    elif 'modifiers' in item_modifier:
        modifiers = item_modifier['modifiers']
    else:
        return item_modifier
    for modifier in modifiers:
        if 'conditions' in modifier:
            modifier['condition'] = {
                "type": "minecraft:all_of",
                "terms": recursive_convert_condition_to_type(modifier.pop('conditions'))
            }
    return item_modifier

def fix_item_modifier_convert_function_to_type(item_modifier: dict) -> dict:
    if 'functions' not in item_modifier:
        item_modifier['type'] = item_modifier.pop('function')
        return item_modifier
    for function in item_modifier['functions']:
        function['type'] = function.pop('function')
    return item_modifier


def fix_loot_table_convert_functions_to_modifier(loot_table: dict) -> dict:
    for pool in loot_table.get('pools', []):
        for entry in pool.get('entries', []):
            if 'functions' in entry:
                entry['modifier'] = entry.pop('functions')
    return loot_table


def fix_loot_table_inline_modifiers(loot_table: dict) -> dict:
    for pool in loot_table.get('pools', []):
        for entry in pool.get('entries', []):
            modifier = entry.get('modifier')
            if modifier is None:
                continue
            if isinstance(modifier, dict):
                entry['modifier'] = fix_item_modifier_convert_function_to_type(modifier)
            else:
                for i, item_modifier in enumerate(modifier):
                    if isinstance(item_modifier, str):
                        continue
                    modifier[i] = fix_item_modifier_convert_function_to_type(item_modifier)
    return loot_table

def fix_processor_list_block_state(processor_list: dict) -> dict:
    for matched in recursive_key_sequence_find(processor_list, ('block_state',)):
        if 'Name' in matched:
            matched['id'] = matched.pop('Name')
        if 'Properties' in matched:
            matched['properties'] = matched.pop('Properties')
    for matched in recursive_key_sequence_find(processor_list, ('output_state',)):
        if 'Name' in matched:
            matched['id'] = matched.pop('Name')
        if 'Properties' in matched:
            matched['properties'] = matched.pop('Properties')
    return processor_list


for dirpath, dirnames, filenames in os.walk(advancements_dir):
    for file in filenames:
        latest_version_path = find_latest_version(path.join(dirpath, file))
        new_version_path = path.join(datapack_dir, '26.3', path.realpath(path.join(dirpath, file)).removeprefix(path.realpath(datapack_dir)).removeprefix(path.sep))
        with open(latest_version_path, mode='r') as rf:
            advancement = json.load(rf)
        changed = False
        changed |= fix_advancement_condition_reference(advancement)
        changed |= fix_advancement_convert_condition_to_type(advancement)
        changed |= fix_advancement_entity_condition(advancement)
        changed |= fix_advancement_player_list_condition(advancement)
        changed |= fix_advancement_location_list_condition(advancement)
        changed |= fix_advancement_block_state_property(advancement)
        if not changed:
            continue
        with open(new_version_path, mode='w') as wf:
            json.dump(advancement, wf, indent=4)


for dirpath, dirnames, filenames in os.walk(predicates_dir):
    for file in filenames:
        latest_version_path = find_latest_version(path.join(dirpath, file))
        new_version_path = path.join(datapack_dir, '26.3', path.realpath(path.join(dirpath, file)).removeprefix(path.realpath(datapack_dir)).removeprefix(path.sep))
        with open(latest_version_path, mode='r') as rf:
            predicate = json.load(rf)
        before = json.dumps(predicate)
        #predicate = fix_predicate_no_root_list(predicate)
        predicate = recursive_convert_condition_to_type(predicate)
        predicate = recursive_fix_condition_reference(predicate)
        if isinstance(predicate, list):
            print(file)
        after = json.dumps(predicate)
        if before == after:
            continue
        with open(new_version_path, mode='w') as wf:
            json.dump(predicate, wf, indent=4)


for dirpath, dirnames, filenames in os.walk(item_modifiers_dir):
    for file in filenames:
        if path.splitext(file)[-1].lower() != '.json':
            continue
        latest_version_path = find_latest_version(path.join(dirpath, file))
        new_version_path = path.join(datapack_dir, '26.3', path.realpath(path.join(dirpath, file)).removeprefix(path.realpath(datapack_dir)).removeprefix(path.sep))
        with open(latest_version_path, mode='r') as rf:
            item_modifier = json.load(rf)
        before = json.dumps(item_modifier)
        item_modifier = fix_item_modifier_no_root_list(item_modifier)
        item_modifier = fix_item_modifier_conditions(item_modifier)
        item_modifier = fix_item_modifier_convert_function_to_type(item_modifier)
        after = json.dumps(item_modifier)
        if before == after:
            continue
        with open(new_version_path, mode='w') as wf:
            json.dump(item_modifier, wf, indent=4)


for dirpath, dirnames, filenames in os.walk(loot_tables_dir):
    for file in filenames:
        if path.splitext(file)[-1].lower() != '.json':
            continue
        latest_version_path = find_latest_version(path.join(dirpath, file))
        new_version_path = path.join(datapack_dir, '26.3', path.realpath(path.join(dirpath, file)).removeprefix(path.realpath(datapack_dir)).removeprefix(path.sep))
        with open(latest_version_path, mode='r') as rf:
            loot_table = json.load(rf)
        before = json.dumps(loot_table)
        loot_table = recursive_fix_condition_reference(loot_table)
        assert isinstance(loot_table, dict)
        loot_table = fix_loot_table_convert_functions_to_modifier(loot_table)
        loot_table = fix_loot_table_inline_modifiers(loot_table)
        after = json.dumps(loot_table)
        if before == after:
            continue
        with open(new_version_path, mode='w') as wf:
            json.dump(loot_table, wf, indent=4)


for dirpath, dirnames, filenames in os.walk(processor_list_dir):
    for file in filenames:
        if path.splitext(file)[-1].lower() != '.json':
            continue
        latest_version_path = find_latest_version(path.join(dirpath, file))
        new_version_path = path.join(datapack_dir, '26.3', path.realpath(path.join(dirpath, file)).removeprefix(path.realpath(datapack_dir)).removeprefix(path.sep))
        with open(latest_version_path, mode='r') as rf:
            processor_list = json.load(rf)
        before = json.dumps(processor_list)
        processor_list = recursive_fix_condition_reference(processor_list)
        assert isinstance(processor_list, dict)
        processor_list = fix_processor_list_block_state(processor_list)
        after = json.dumps(processor_list)
        if before == after:
            continue
        with open(new_version_path, mode='w') as wf:
            json.dump(processor_list, wf, indent=4)
