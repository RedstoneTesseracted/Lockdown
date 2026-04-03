# Function used by create_patrol_point to shift execution context to the newly summoned entity

tag @s add lockdown.drone.patrol_marker
execute store result score @s lockdown.creation_timestamp run time query gametime
data modify entity @s data.OwnerUUID set from storage lockdown:temp OwnerUUID

attribute @s minecraft:scale base set 0.001

data modify entity @s NoGravity set value 1b
data modify entity @s Small set value 1b
data modify entity @s NoBasePlate set value 1b
# Setting either of these to "true" breaks bee targeting in 26.1
data modify entity @s Marker set value 0b
data modify entity @s Invisible set value 0b

# Obtain UUID of new entity to be stored as target for drone
data modify storage lockdown:temp chosen_uuid set from entity @s UUID
