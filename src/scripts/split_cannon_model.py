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


def find_group(group_list, name):
    """
    Recursively searches the given group list for a group of the given name.  Only returns the first group found.
    """
    for child in group_list:
        if isinstance(child, int):
            continue
        elif child.get('name') == name:
            return child
        elif 'children' in child:
            result = find_group(child['children'], name)
            if result is not None:
                return result


def recursive_map_indices(group, index_map):
    """
    Recursively maps all element indices in a group and its child groups to new values.
    Modifies the given group in-place.
    """
    for i, child in enumerate(group.get('children', [])):
        if isinstance(child, int):
            group['children'][i] = index_map[child]
        elif 'children' in child:
            recursive_map_indices(child, index_map)
        else:
            raise ValueError(f"Unhandled case for child: {child}")


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
    index_map = dict((j, i) for i, j in enumerate(indices))

    # Create new model with other elements/groups filtered out
    new_model = deepcopy(model)
    new_model['elements'] = deepcopy(new_elements)
    new_model['groups'] = [i for i in new_model['groups'] if i['name'] == name]
    for group in new_model['groups']:
        recursive_map_indices(group, index_map)

    return new_model


def shift_model(model, x=0.0, y=0.0, z=0.0):
    """
    Shifts all elements in the model by the given vector.  Modifies a model in-place
    """
    for element in model['elements']:
        element['from'][0] += x
        element['from'][1] += y
        element['from'][2] += z
        element['to'][0] += x
        element['to'][1] += y
        element['to'][2] += z
        if 'rotation' in element:
            assert 'origin' in element['rotation']
            element['rotation']['origin'][0] += x
            element['rotation']['origin'][1] += y
            element['rotation']['origin'][2] += z


base_model = get_group('base', full_model)
gantry_model = get_group('gantry', full_model)
cannon_model = get_group('cannon', full_model)
arcs_model = get_group('arcs', full_model)

# Make some elements in cannon emissive
for group in ['core', 'shroud_glowy_bits']:
    for i in find_group(cannon_model['groups'], group)['children']:
        cannon_model['elements'][i]['light_emission'] = 15

# Find axel axis in barrel model and use it to shift entire barrel
left_axel = None
right_axel = None
for element in cannon_model['elements']:
    if element.get('name') == 'left_axel':
        left_axel = ((element['from'][0] + element['to'][0])/2,
                     (element['from'][1] + element['to'][1])/2,
                     (element['from'][2] + element['to'][2])/2)
    elif element.get('name') == 'right_axel':
        right_axel = ((element['from'][0] + element['to'][0])/2,
                      (element['from'][1] + element['to'][1])/2,
                      (element['from'][2] + element['to'][2])/2)
dx, dy, dz = [8-(i+j)/2 for i, j in zip(left_axel, right_axel)]
shift_model(cannon_model, x=dx, y=dy, z=dz)
shift_model(arcs_model, x=dx, y=dy, z=dz)

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
        "translation": [3, -0.625, 0],
        "scale": [0.5, 0.5, 0.5]
    },
    "thirdperson_lefthand": {
        "rotation": [0, 90, 0],
        "translation": [3, -0.625, 0],
        "scale": [0.5, 0.5, 0.5]
    },
    "firstperson_righthand": {
        "rotation": [15, 30, 8],
        "translation": [2.75, 2.125, 1.75]
    },
    "firstperson_lefthand": {
        "rotation": [15, 30, 0],
        "translation": [2.75, 2.125, 1.75]
    },
    "ground": {
        "translation": [0, -2.25, 6]
    },
    "gui": {
        "rotation": [30, -135, 0],
        "translation": [-4.25, 2.75, -5]
    },
    "head": {
        "translation": [9.75, -0.5, -3.5]
    },
    "fixed": {
        "rotation": [90, 0, -180],
        "translation": [0, -6, -0.5]
    },
    "on_shelf": {
        "rotation": [-90, 0, 0],
        "translation": [0, 0, -2.5]
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

# We also save the fully-assembled cannon model for the advancement preview
with open(path.join(out_dir, 'preview.json'), mode='w') as wf:
    json.dump(full_model, wf, indent=4)

