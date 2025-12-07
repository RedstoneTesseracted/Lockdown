"""
A simple script to generate all force field models
"""
import json
from math import floor


for width in range(1, 6):
    for height in range(1, 6):
        if not width % 2:
            offset = -0.5
        else:
            offset = 0.0
        model = {
                    "parent": "minecraft:block/block",
                    "textures": {
                        "field": "lockdown:item/effects/force_field",
                        "particle": "lockdown:item/effects/force_field"
                    },
                    "elements": [
                        {
                            "from": [8.0-3.2*(width/2)+offset*3.2, 8.0, 8.0-1.6],
                            "to": [8.0+3.2*(width/2)+offset*3.2, 8.0+3.2*height, 8.0+1.6],
                            "faces": {
                                "down": {
                                    "texture": "#field",
                                    "uv": [0.0, 0.0, width*3.2, 3.2],
                                    "cullface": "down"
                                },
                                "up": {
                                    "texture": "#field",
                                    "uv": [0.0, 0.0, width*3.2, 3.2],
                                    "cullface": "up"
                                },
                                "north": {
                                    "texture": "#field",
                                    "uv": [0.0, 0.0, width*3.2, height*3.2],
                                    "cullface": "north"
                                },
                                "south": {
                                    "texture": "#field",
                                    "uv": [0.0, 0.0, width*3.2, height*3.2],
                                    "cullface": "south"
                                },
                                "east": {
                                    "texture": "#field",
                                    "uv": [0.0, 0.0, 3.2, height*3.2],
                                    "cullface": "east"
                                },
                                "west": {
                                    "texture": "#field",
                                    "uv": [0.0, 0.0, 3.2, height*3.2],
                                    "cullface": "west"
                                }
                            }
                        }
                    ]
                }
        with open(f'force_field{width}{height}.json', mode='w') as wf:
            json.dump(model, wf, indent=4)
