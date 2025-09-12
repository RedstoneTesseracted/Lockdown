"""
This script contains unit tests to ensure various text translation keys
actually exist within resource pack.

Author: Redstone⁴
"""
import pytest
from json import load
import os
from os import path


# Commonly re-used variables
resource_pack_dir = path.join('src', 'Resource-Pack')
data_pack_dir = path.join('src', 'Data-Pack')
recipes_dir = path.join(data_pack_dir, 'Lockdown', 'data', 'lockdown', 'recipe')
lang_dir = path.join(resource_pack_dir, 'Lockdown', 'assets', 'minecraft', 'lang')
en_us_path = path.join(lang_dir, 'en_us.json')



def recursive_key_find(dictionary: dict, search_key: str) -> list:
    """
    Recursively searches for all entries with the given key within a dictionary.

    Arguments:
        dictionary (dict): Dictionary to search
        search_key (str): Key to search for

    Returns:
        (list): List of all values found for a key 
    """
    result = []
    for key, value in dictionary.items():
        if key == search_key:
            result.append(value)
        elif hasattr(value, 'items'):
            result += recursive_key_find(value, search_key)
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
    for dirpath, dirnames, filenames in os.walk(recipes_dir):
        for file in filenames:
            if path.splitext(file)[-1] != 'json': continue
            with open(path.join(dirpath, file), mode='r') as rf:
                recipe = load(rf)
            components = recipe['result'].get('components')
            if components is None: continue
            for value in recursive_key_find(components, 'translate'):
                assert value in keys, f'Recipe {file} referenced missing key: {value}'
    
