"""
Simple script to generate the alarm light recipes
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
with open('white_alarm.json', mode='r') as rf:
    template = json.load(rf)

# Generate all variants
for name, code in name_colors.items():
    template['key']['s'][0] = f'minecraft:{name}_stained_glass'
    template['result']['components']['minecraft:item_name'] = '{"translate":"item.lockdown.alarm_light_' + name + '","fallback":"' + " ".join(map(str.capitalize, name.split('_'))) + ' Alarm Light","color":"' + code + '"}'
    template['result']['components']['minecraft:item_model'] = f'lockdown:alarm/{name}_alarm_light'
    template['result']['components']['minecraft:custom_data']['lockdown_data']['name'] = f'{name}_alarm_light'
    template['result']['components']['minecraft:entity_data'].replace('white', name)
    with open(f'{name}_alarm.json', mode='w') as wf:
        json.dump(template, wf, indent=4)
