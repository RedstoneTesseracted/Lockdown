"""
Simple script to generate the big button recipes
"""
import json


# Declare colors
name_colors = {
        'red': 'red',
        'blue': 'dark_blue',
        'orange': 'gold',
        'black': 'dark_gray',
        'pink': 'light_purple',
        'magenta': 'light_purple',
        'yellow': 'yellow',
        'purple': 'dark_purple',
        'lime': 'green',
        'green': 'dark_green',
        'gray': 'dark_gray',
        'light_gray': 'gray',
        'brown': 'gold',
        'cyan': 'dark_aqua',
        'light_blue': 'blue'
    }



# Load regular keycard as a template
with open('white_button.json', mode='r') as rf:
    template = json.load(rf)

# Generate all variants
for name, code in name_colors.items():
    template['key']['t'][0] = f'minecraft:{name}_concrete'
    template['result']['components']['minecraft:item_name'] = '{"translate":"item.lockdown.big_button_' + name + '","fallback":"Big ' + " ".join(map(str.capitalize, name.split('_'))) + ' Button","color":"' + code + '"}'
    template['result']['components']['minecraft:item_model'] = f'lockdown:button/{name}_button_off'
    template['result']['components']['minecraft:custom_data']["lockdown_data"]["name"] = name + '_big_button'
    template['result']['components']['minecraft:entity_data'].replace('white', name)
    with open(f'{name}_button.json', mode='w') as wf:
        json.dump(template, wf, indent=4)
