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
    Generates all item modifiers used to set the components for a lockdown item
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


def main():
    os.chdir(path.split(__file__)[0])
    generate_item_advancements()
    generate_items()
    generate_item_modifiers()


if __name__ == "__main__":
    main()
