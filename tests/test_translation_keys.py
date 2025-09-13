"""
This script contains unit tests to ensure various text translation keys
actually exist within resource pack.

Author: Redstone⁴
"""
import pytest
from json import load
import os
from os import path
from common import recipes_dir, item_modifiers_dir, lang_dir, en_us_path, recursive_key_find



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

