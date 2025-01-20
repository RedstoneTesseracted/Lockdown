"""
Simple script to generate the keycard recipes
"""
import json


# Declare colors
colors = {
        'red': 0x9B3F3F,
        'blue': 0x46479A,
        'orange': 0xFF8000,
        'black': 0x26282C,
        'pink': 0xDC7C9E,
        'magenta': 0xC960C0,
        'yellow': 0xF3BD36,
        'purple': 0x9046B9,
        'lime': 0x87C536,
        'green': 0X6D8534,
        'white': 0xF8F8F8,
        'gray': 0x53565A,
        'light_gray': 0x92938C,
        'brown': 0x8A6246,
        'cyan': 0x329EA1,
        'light_blue': 0x63CBE7
    }



# Load regular keycard as a template
with open('keycard.json', mode='r') as rf:
    template = json.load(rf)

# Generate all variants
for name, color in colors.items():
    template['result']['components']['minecraft:dyed_color'] = {'rgb': color, 'show_in_tooltip': False}
    template['key']['e'][0] = f'minecraft:{name}_dye'
    template['result']['components']['minecraft:item_name'] = '{"translate":"item.lockdown.keycard_' + name + '","fallback":"' + " ".join(map(str.capitalize, name.split('_'))) + ' Keycard"}'
    with open(f'{name}_keycard.json', mode='w') as wf:
        json.dump(template, wf, indent=4)
