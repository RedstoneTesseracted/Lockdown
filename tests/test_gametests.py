"""
This script contains unit tests to ensure several block-based tests
yield reliable results

Author: Redstone⁴
"""
import pytest
from json import load
import os
from os import path
from common import recipes_dir, test_instance_dir, data_pack_dir, recursive_key_find, resolve_structure_path, resolve_loot_table_path, resolve_item_modifier_path
import nbtlib
import re



def test_items_unchanged_test_is_complete():
    """
    Confirm that the "lockdown:misc/items_unchanged" game test covers ALL custom items
    """
    # Scan the output of every recipe file to build a list of all custom items
    custom_items = set()
    for dirpath, dirnames, filenames in os.walk(recipes_dir):
        for file in filenames:
            if path.splitext(file)[-1] != '.json': continue
            with open(path.join(dirpath, file), mode='r') as rf:
                recipe = load(rf)
            components = recipe['result'].get('components')
            
            if components is None: continue
            for value in recursive_key_find(components, 'lockdown_data'):
                if 'name' not in value: continue
                custom_items.add(value['name'])

    # Obtain the path to the structure file using the test instance
    with open(path.join(test_instance_dir, 'misc', 'items_unchanged.json'), mode='r') as rf:
        test_instance = load(rf)
    structure_path = resolve_structure_path(test_instance['structure'])

    # Scan the structure corresponding to the game test
    structure = nbtlib.load(structure_path, gzipped=True)
    used_loot_tables = set()
    present_items = set()
    for block in structure['blocks']:
        if 'nbt' not in block: continue
        if block['nbt']['id'] == 'minecraft:chest':
            for item in block['nbt']['Items']:
                for value in recursive_key_find(item, 'lockdown_data'):
                    if 'name' not in value: continue
                    present_items.add(str(value['name']))
        elif block['nbt']['id'] == 'minecraft:command_block':
            command = block['nbt']['Command']
            matched = re.match(r'/?loot insert ~\d* ~\d* ~\d* loot ([a-z0-9_]+:[a-z0-9_/]+)', command)
            if matched is None: continue
            loot_table = matched.groups()[0]
            used_loot_tables.add(loot_table)
        else:
            continue

    assert len(present_items) > 0, "Failed to detect any items within the structure"
    assert len(used_loot_tables) > 0, "Failed to detect any used loot tables within the structure"
    assert len(present_items - custom_items) == 0, f'Structure chests contain unrecognized items: {present_items - custom_items}'
    assert len(custom_items - present_items) == 0, f'Items missing from structure chests: {custom_items - present_items}'

    # We need to expand the loot tables to determine what items they try to add
    loot_table_items = set()
    for loot_table_resource in used_loot_tables:
        loot_table_path = resolve_loot_table_path(loot_table_resource)
        with open(loot_table_path, mode='r') as rf:
            loot_table = load(rf)
        # I am going to make the very questionable assumption that nothing will
        # ever possibly change about how these files are structured.
        # Basically:
        #   * Each loot table referenced by the structure consists of a list of pools
        #   * Every pool has exactly ONE entry with 100% chance of occurring
        #   * Each entry references a loot table representing a custom item
        #   * Every custom item loot table has exactly ONE pool with ONE entry with ONE function,
        #     and that function is a reference to an item modifier
        #   * The item modifier contains the custom item name in the "minecraft:custom_data"
        #     component under "lockdown_data.name"
        for pool in loot_table.get('pools', []):
            assert pool['entries'][0]['type'] == 'minecraft:loot_table'
            with open(resolve_loot_table_path(pool['entries'][0]['value']), mode='r') as rf:
                referenced_loot_table = load(rf)
            assert referenced_loot_table['pools'][0]['entries'][0]['functions'][0]['function'] == 'minecraft:reference'
            item_modifier_resource = referenced_loot_table['pools'][0]['entries'][0]['functions'][0]['name']
            with open(resolve_item_modifier_path(item_modifier_resource), mode='r') as rf:
                item_modifier = load(rf)
            for value in recursive_key_find(item_modifier, 'lockdown_data'):
                if 'name' not in value: continue
                loot_table_items.add(value['name'])
    
    assert len(loot_table_items - custom_items) == 0, f'Structure loot tables contain unrecognized items: {loot_table_items - custom_items}'
    assert len(custom_items - loot_table_items) == 0, f'Items missing from structure loot tables: {custom_items - loot_table_items}'


