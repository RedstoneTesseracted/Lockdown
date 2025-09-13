"""
Common constants and functions used by static unit tests

Author: Redstone⁴
"""
from os import path
from typing import Union


# Define resource paths
data_pack_dir = path.join('src', 'Data-Pack', 'Lockdown')
recipes_dir = path.join(data_pack_dir, 'data', 'lockdown', 'recipe')
item_modifiers_dir = path.join(data_pack_dir, 'data', 'lockdown', 'item_modifier')
test_instance_dir = path.join(data_pack_dir, 'data', 'lockdown', 'test_instance')

resource_pack_dir = path.join('src', 'Resource-Pack', 'Lockdown')
lang_dir = path.join(resource_pack_dir, 'assets', 'minecraft', 'lang')
en_us_path = path.join(lang_dir, 'en_us.json')


# Utility functions
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


def datapack_resource_path(resource_location: str, resource_type: str, pack_root: str = data_pack_dir) -> str:
    """
    Resolves a minecraft data pack resource location to a file path

    Arguments:
        resource_location (str): Resource location to resolve
        resource_type (str): Subdirectory within the datapack namespace directory
        pack_root (str): Path to root data pack directory

    Returns:
        (str): Resolved path to file
    """
    namespace, sep, partial_path = resource_location.partition(':')
    if sep != ':':
        partial_path = namespace
        namespace = 'minecraft'
    partial_path = path.join(*partial_path.split('/'))
    match resource_type:
        case 'function':
            ext = '.mcfunction'
        case 'structure':
            ext = '.nbt'
        case _:
            ext = '.json'
    return path.join(data_pack_dir, 'data', namespace, resource_type, partial_path + ext)


def resourcepack_resource_path(resource_location: str, resource_type: str, pack_root: str = resource_pack_dir) -> str:
    """
    Resolves a minecraft resource pack resource location to a file path

    Arguments:
        resource_location (str): Resource location to resolve
        resource_type (str): Subdirectory within the datapack namespace directory
        pack_root (str): Path to root resource pack directory

    Returns:
        (str): Resolved path to file
    """
    namespace, sep, partial_path = resource_location.partition(':')
    if sep != ':':
        structure_partial_path = namespace
        namespace = 'minecraft'
    partial_path = path.join(*partial_path.split('/'))
    match resource_type:
        case 'sounds':
            ext = '.ogg'
        case 'shaders':
            raise NotImplementedError('shader resource-types are not supported')
        case 'texts':
            ext = '.txt'
        case 'textures':
            ext = '.png'
        case _:
            ext = '.json'
    return path.join(data_pack_dir, 'assets', namespace, resource_type, partial_path + ext)



def resolve_item_modifier_path(item_modifier_resource: str, pack_root: str = data_pack_dir):
    """
    Resolves a item modifier resource location from <namespace>:<location> to a file path

    Arguments:
        item_modifier_resource (str): Loot table resource location
        pack_root (str): Path to root data pack directory

    Returns:
        (str): Resolved path to file
    """
    return datapack_resource_path(item_modifier_resource, 'item_modifier', pack_root=pack_root)


def resolve_loot_table_path(loot_table_resource: str, pack_root: str = data_pack_dir):
    """
    Resolves a loot table resource location from <namespace>:<location> to a file path

    Arguments:
        loot_table_resource (str): Loot table resource location
        pack_root (str): Path to root data pack directory

    Returns:
        (str): Resolved path to file
    """
    return datapack_resource_path(loot_table_resource, 'loot_table', pack_root=pack_root)


def resolve_structure_path(structure_resource: str, pack_root: str = data_pack_dir):
    """
    Resolves a structure resource location from <namespace>:<location> to a file path

    Arguments:
        structure_resource (str): Structure resource location
        pack_root (str): Path to root data pack directory

    Returns:
        (str): Resolved path to file
    """
    return datapack_resource_path(structure_resource, 'structure', pack_root=pack_root)
