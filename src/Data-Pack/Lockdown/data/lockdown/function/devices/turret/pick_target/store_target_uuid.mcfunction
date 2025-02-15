# This function stores an entity's UUID in its scoreboard to make it easier for the
# turret to target it
# This is run BY the selected target

data modify storage lockdown:temp target.uuid set from entity @s UUID
