"""
This script generates item modifiers for all spray can colors, using white.json as a base
"""
import json
from os import path
import os


os.chdir(path.dirname(__file__))


# For each pair:
# * First entry is used for translation key
# * Second entry is used for tint and text color
colors = [
    ['black', '#1D1D21'],
    ['blue', '#3C44AA'],
    ['brown', "#835432"],
    ['cyan', '#169C9C'],
    ['gray', '#474F52'],
    ['green', '#5E7C16'],
    ['light_blue', '#3AB3DA'],
    ['light_gray', '#9D9D97'],
    ['lime', '#80C71F'],
    ['magenta', '#C74EBD'],
    ['orange', '#F9801D'],
    ['pink', '#F38BAA'],
    ['purple', '#8932B8'],
    ['red', '#B02E26'],
    ['yellow', '#FED83D'],
]


with open('white.json', mode='r') as rf:
    template = json.load(rf)

for color, color_code in colors:
    template['components']['minecraft:dyed_color'] = int(color_code.lstrip('#'), base=16)
    template['components']['minecraft:item_name']['with'][0]['translate'] = 'color.minecraft.' + color
    template['components']['minecraft:item_name']['with'][0]['color'] = color_code

    with open(f'{color}.json', mode='w') as wf:
        json.dump(template, wf, indent=4)
