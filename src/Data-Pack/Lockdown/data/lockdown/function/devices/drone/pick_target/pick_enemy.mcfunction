# This function handles picking a new target for the drone
#
# This is run BY and AT the drone base entity

# Store/prepare some values that will be used in the below functions
data modify storage lockdown:temp approved set from entity @s data.approved
execute store result score lockdown.drone.x lockdown.local run data get entity @s Pos[0]
execute store result score lockdown.drone.y lockdown.local run data get entity @s Pos[1]
execute store result score lockdown.drone.z lockdown.local run data get entity @s Pos[2]
scoreboard players set lockdown.highest_priority lockdown.local -2147483648

# Evaluate all entities within range
data remove storage lockdown:temp args
data modify storage lockdown:temp args set value {range: 0} 
execute store result storage lockdown:temp args.range int 1 run scoreboard players get @s lockdown.pursuit_enter_range
tag @s add lockdown.exclude
function lockdown:devices/drone/pick_target/__pick_enemy with storage lockdown:temp args
tag @s remove lockdown.exclude

# Pick the enemy with the highest priority
# See lockdown:devices/drone/pick_target/evaluate_suspect for how priority is calculated
scoreboard players set lockdown.found_highest lockdown.local 0
execute as @e[tag=lockdown.drone.enemy] run function lockdown:devices/drone/pick_target/choose_highest_priority
execute if score lockdown.found_highest lockdown.local matches 1 on vehicle on target run kill @s[tag=lockdown.drone.patrol_marker]
execute if score lockdown.found_highest lockdown.local matches 1 run function lockdown:devices/drone/pick_target/store_target_uuid

# Restore approval list from temporary copy
data modify entity @s data.approved set from storage lockdown:temp approved
data remove storage lockdown:temp approved

# Return boolean used to signal other functions to change state
execute if score lockdown.found_highest lockdown.local matches 1 run return 1
return 0
