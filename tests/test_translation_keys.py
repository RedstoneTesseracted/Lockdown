"""
This script contains unit tests to ensure various text translation keys
actually exist within resource pack.

Author: Redstone⁴
"""
import pytest
from json import load
import os
from os import path
from typing import Union


# Commonly re-used variables
resource_pack_dir = path.join('src', 'Resource-Pack')
data_pack_dir = path.join('src', 'Data-Pack')
recipes_dir = path.join(data_pack_dir, 'Lockdown', 'data', 'lockdown', 'recipe')
item_modifiers_dir = path.join(data_pack_dir, 'Lockdown', 'data', 'lockdown', 'item_modifier')
lang_dir = path.join(resource_pack_dir, 'Lockdown', 'assets', 'minecraft', 'lang')
en_us_path = path.join(lang_dir, 'en_us.json')



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



def test_all_languages_have_keys():
    """
    Confirm that all defined language files have the same keys as en_us
    """
    # Load en_us as a reference
    with open(en_us_path, mode='r') as rf:
        keys = set(load(rf).keys())

    # Check the keys in every other language file
    for file in os.listdir(lang_dir):
        if file == 'en_us.json': continue
        with open(path.join(lang_dir, file), mode='r') as rf:
            other_keys = set(load(rf).keys())
        assert len(keys - other_keys) == 0, f'{file} is missing keys: {keys - other_keys}'
        assert len(other_keys - keys) == 0, f'{file} contains additional keys: {other_keys - keys}'


def test_recipes_reference_existing_keys():
    """
    Confirm that all custom items defined using recipe outputs reference translation keys that actually exist
    """
    # Load en_us as a reference
    with open(en_us_path, mode='r') as rf:
        keys = set(load(rf).keys())

    # Check the output of every recipe file
    actually_did_anything = False
    for dirpath, dirnames, filenames in os.walk(recipes_dir):
        for file in filenames:
            if path.splitext(file)[-1] != '.json': continue
            with open(path.join(dirpath, file), mode='r') as rf:
                recipe = load(rf)
            components = recipe['result'].get('components')
            
            if components is None: continue
            for value in recursive_key_find(components, 'translate'):
                assert value in keys, f'Recipe {file} referenced missing key: {value}'
                actually_did_anything = True

    assert actually_did_anything, "No actual recipe checks were performed?"


def test_item_modifiers_reference_existing_keys():
    """
    Confirm that all item modifiers reference translation keys that actually exist
    """
    # Load en_us as a reference
    with open(en_us_path, mode='r') as rf:
        keys = set(load(rf).keys())

    # Check all item modifiers
    actually_did_anything = False
    for dirpath, dirnames, filenames in os.walk(item_modifiers_dir):
        for file in filenames:
            if path.splitext(file)[-1] != '.json': continue
            with open(path.join(dirpath, file), mode='r') as rf:
                item_modifier = load(rf)
            
            for value in recursive_key_find(item_modifier, 'translate'):
                assert value in keys, f'Item modifier {file} referenced missing key: {value}'
                actually_did_anything = True

    assert actually_did_anything, "No actual item modifier checks were performed?"

