"""
This script contains unit tests to ensure there are no missing loot tables in any structures.

Author: Redstone⁴
"""
import pytest
from json import load
import os
from os import path
import nbtlib
from common import structure_dir, loot_table_dir, template_pool_dir


def resource_name(resource_base_dir, file_path, namespace):
    """
    Obtains the datapack resource location from a file path

    Arguments:
        resource_base_dir (str): Top-level directory for this resource type
        file_path (str): File path of resource
        namespace (str): Namespace to prepend to resource location
    """
    relative_path = path.abspath(path.splitext(file_path)[0]).removeprefix(path.abspath(resource_base_dir)).replace(path.sep, '/').removeprefix('/')
    return namespace + ':' + relative_path


def get_all_resources_in(directory, extension=None):
    """
    Retrieves a list of namespaced resourced from the given directory

    Arguments:
        directory (str): Directory to scan for resources.
        extension (Optional[str]): If provided, files without this extension will be ignored.
    """
    resources = []
    for dirpath, dirnames, filenames in os.walk(directory):
        for file in filenames:
            basename, ext = path.splitext(file)
            if extension is not None and ext != extension:
                continue
            resources.append(resource_name(directory, path.join(dirpath, basename), 'lockdown'))
    return resources


def test_structure_loot_tables_exist():
    
    """
    Confirm that no structures reference loot tables that don't exist
    """
    # Gather a list of all loot tables defined by the data pack
    loot_tables = get_all_resources_in(loot_table_dir, extension='.json')

    # Scan through all structures and collect a list of missing loot tables
    missing = set()
    for dirpath, dirnames, filenames in os.walk(structure_dir):
        for file in filenames:
            if path.splitext(file)[-1] != '.nbt':
                continue
            structure = nbtlib.load(path.join(dirpath, file), gzipped=True)
            resource = resource_name(structure_dir, path.join(dirpath, file), 'lockdown')
            # Check all blocks in structure
            for block in structure['blocks']:
                if 'nbt' not in block: continue
                if 'LootTable' not in block['nbt']: continue
                loot_table = str(block['nbt']['LootTable'])
                if loot_table not in loot_tables:
                    block_id = str(block['nbt']['id'])
                    x, y, z = [int(i) for i in block['pos']]
                    print(f"WARNING: {block_id} at ({x}, {y}, {z}) in {resource} references missing loot table {loot_table}")
                    missing.add(loot_table)

            # Check all entities in structure
            for entity in structure['entities']:
                if 'nbt' not in entity: continue
                if 'DeathLootTable' not in entity['nbt']: continue
                loot_table = str(entity['nbt']['DeathLootTable'])
                if loot_table not in loot_tables:
                    entity_name = str(entity['nbt']['id'])
                    print(f"WARNING: {entity_name} in {resource} references missing loot table {loot_table}")
                    missing.add(loot_table)

    # Report missing loot tables
    assert len(missing) == 0, f"Some structures are missing the following loot tables: {', '.join(missing)}"


def test_structure_jigsaws():
    """
    Tests that all structure jigsaw blocks reference real template pools and connections
    """
    # Gather a list of all template pools defined by the data pack
    template_pools = get_all_resources_in(template_pool_dir, extension='.json')
    template_pools.append('minecraft:empty')

    # Scan through all structures and collect a list of missing loot tables
    missing_pools = set()
    connection_names = dict()
    connection_targets = dict()
    for dirpath, dirnames, filenames in os.walk(structure_dir):
        for file in filenames:
            if path.splitext(file)[-1] != '.nbt':
                continue
            structure = nbtlib.load(path.join(dirpath, file), gzipped=True)
            resource = resource_name(structure_dir, path.join(dirpath, file), 'lockdown')
            # Check all blocks in structure
            for block in structure['blocks']:
                if 'nbt' not in block: continue
                if 'id' not in block['nbt']: continue
                if str(block['nbt']['id']) != 'minecraft:jigsaw': continue
                pool = str(block['nbt']['pool'])
                name = str(block['nbt']['name'])
                target = str(block['nbt']['target'])
                if name not in connection_names:
                    connection_names[name] = set()
                if target not in connection_targets:
                    connection_targets[target] = set()
                connection_names[name].add(resource)
                connection_targets[target].add(resource)
                if pool not in template_pools:
                    x, y, z = [int(i) for i in block['pos']]
                    print(f"WARNING: jigsaw at ({x}, {y}, {z}) in {resource} references missing template pool {pool}")
                    missing_pools.add(pool)

    # Report missing template pools
    assert len(missing_pools) == 0, f"Found missing template pools in some structures: {', '.join(missing_pools)}"

    # Report missing connections
    for i in connection_names.keys() - connection_targets.keys():
        print(f"WARNING: jigsaw name {i} is not the target of any other jigsaw (appears in {', '.join(connection_names[i])})")
    for i in connection_targets.keys() - connection_names.keys():
        print(f"WARNING: jigsaw target {i} is not the name of any other jigsaw (appears in {', '.join(connection_targets[i])})")
    unmatched = connection_names.keys() ^ connection_targets.keys()
    assert len(unmatched) == 0, f"Found unpaired jigsaw names in some structures: {', '.join(unmatched)}"
