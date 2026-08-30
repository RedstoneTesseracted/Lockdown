"""
This script splits the full laser cannon model into three separate parts.

Author: Redstone⁴
"""
import json
from os import path
from copy import deepcopy


# Directory to save models to, relative to this script
out_dir = path.join(path.split(__file__)[0],
                    path.pardir,
                    'Resource-Pack',
                    'Lockdown',
                    'assets',
                    'lockdown',
                    'models',
                    'item',
                    'laser_cannon')

in_file = path.join(path.split(__file__)[0],
                    path.pardir,
                    'models',
                    'laser_cannon_full.json')


# Load source model
with open(in_file, mode='r') as rf:
    full_model = json.load(rf)


# Separate out model parts
def recursive_get_indices(group):
    """
    Recursively retrieves all element indices from a group and its child groups
    """
    result = []
    for child in group.get('children', []):
        if isinstance(child, int):
            result.append(child)
        elif 'children' in child:
            result += recursive_get_indices(child)
    return result


def get_group(name, model):
    """
    Filters a model down to elements belonging to a particular group
    """
    # Get elements in group
    indices = None
    for grp in model['groups']:
        if grp['name'] == name:
            if indices is not None:
                raise ValueError(f"Multiple groups named {name}")
            else:
                indices = recursive_get_indices(grp)
    new_elements = [model['elements'][i] for i in indices]

    # Create new model with other elements/groups filtered out
    new_model = deepcopy(model)
    new_model['elements'] = new_elements
    new_model['groups'] = [i for i in new_model['groups'] if i['name'] == name]

    return new_model


base_model = get_group('base', full_model)
gantry_model = get_group('gantry', full_model)
cannon_model = get_group('cannon', full_model)
arcs_model = get_group('arcs', full_model)


# Override display transformations
base_model['display'] = {
    "thirdperson_righthand": {
        "translation": [0, 4, 1.75],
        "scale": [0.5, 0.5, 0.5]
    },
    "thirdperson_lefthand": {
        "translation": [0, 4, 1.75],
        "scale": [0.5, 0.5, 0.5]
    },
    "firstperson_righthand": {
        "rotation": [7.75, 30, 0],
        "translation": [0, 8.25, 0.25]
    },
    "firstperson_lefthand": {
        "rotation": [7.75, 30, 0],
        "translation": [0, 8.25, 0.25]
    },
    "ground": {
        "translation": [0, 4, 0]
    },
    "gui": {
        "rotation": [30, -135, 0],
        "translation": [0, 6.5, 0]
    },
    "head": {
        "translation": [9.75, 1.25, 1.5]
    },
    "fixed": {
        "rotation": [90, 0, 180],
        "translation": [0, 0, -7]
    },
    "on_shelf": {
        "rotation": [90, 0, 0],
        "translation": [0, 0, 3.75]
    }
}


gantry_model['display'] = {
    "thirdperson_righthand": {
        "translation": [0, 4, 1.75],
        "scale": [0.5, 0.5, 0.5]
    },
    "thirdperson_lefthand": {
        "translation": [0, 4, 1.75],
        "scale": [0.5, 0.5, 0.5]
    },
    "firstperson_righthand": {
        "rotation": [7.75, 30, 0],
        "translation": [0, 8.25, 0.25]
    },
    "firstperson_lefthand": {
        "rotation": [7.75, 30, 0],
        "translation": [0, 8.25, 0.25]
    },
    "ground": {
        "translation": [0, 4, 0]
    },
    "gui": {
        "rotation": [30, -135, 0],
        "translation": [0, 3.75, 0]
    },
    "head": {
        "translation": [9.75, 1.25, 1.5]
    },
    "fixed": {
        "rotation": [-90, -90, -90],
        "translation": [0, 3, -1.75]
    },
    "on_shelf": {
        "rotation": [90, 0, 0],
        "translation": [0, 0, 3.75]
    }
}


cannon_model['display'] = {
    "thirdperson_righthand": {
        "rotation": [0, 90, 0],
        "translation": [5.5, 0.25, 0],
        "scale": [0.5, 0.5, 0.5]
    },
    "thirdperson_lefthand": {
        "rotation": [0, 90, 0],
        "translation": [5.5, 0.25, 0],
        "scale": [0.5, 0.5, 0.5]
    },
    "firstperson_righthand": {
        "rotation": [15, 30, 8],
        "translation": [5.25, 2.5, 6.25]
    },
    "firstperson_lefthand": {
        "rotation": [15, 30, 0],
        "translation": [5.25, 2.5, 6.25]
    },
    "ground": {
        "translation": [0, -0.5, 11]
    },
    "gui": {
        "rotation": [30, -135, 0],
        "translation": [-7.75, 6, 0]
    },
    "head": {
        "translation": [9.75, 1.25, 1.5]
    },
    "fixed": {
        "rotation": [90, 0, -180],
        "translation": [0, -11, -2.25]
    },
    "on_shelf": {
        "rotation": [-125.75, 0, 0],
        "translation": [0, 0, -7]
    }
}

arcs_model['display'] = deepcopy(cannon_model['display'])


# Save models to files
with open(path.join(out_dir, 'base.json'), mode='w') as wf:
    json.dump(base_model, wf, indent=4)

with open(path.join(out_dir, 'gantry.json'), mode='w') as wf:
    json.dump(gantry_model, wf, indent=4)

with open(path.join(out_dir, 'cannon.json'), mode='w') as wf:
    json.dump(cannon_model, wf, indent=4)

with open(path.join(out_dir, 'arcs.json'), mode='w') as wf:
    json.dump(arcs_model, wf, indent=4)




