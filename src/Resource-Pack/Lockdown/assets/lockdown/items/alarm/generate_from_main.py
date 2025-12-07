"""
This script generates the individual alarm light models used by the item-form of alarms.
In retrospect, I'm not sure why I added individual item model definitions when the master definition
exists, but it's too late to change it now!
"""
from json import load, dump


# Read template definition
with open("alarm_light.json", mode='r') as rf:
    source = load(rf)

# Extract and write each case to a separate file
for case in source['model']['cases']:
    model = case['model']
    color = case['when']
    with open(f"{color}_alarm_light.json", mode='w') as wf:
        dump({"model": model}, wf, indent=4)

