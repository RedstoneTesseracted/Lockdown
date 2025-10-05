# This function checks for suspicious activity near the drone

# Safety!
data remove storage lockdown:temp suspect_pos
data remove entity @s data.suspect_pos

# Store/prepare some values that will be used in the below functions
data modify storage lockdown:temp approved set from entity @s data.approved
execute store result score lockdown.drone.x lockdown.local run data get entity @s Pos[0]
execute store result score lockdown.drone.y lockdown.local run data get entity @s Pos[1]
execute store result score lockdown.drone.z lockdown.local run data get entity @s Pos[2]
scoreboard players set lockdown.highest_priority lockdown.local -2147483648

# Evaluate all entities within range
data modify storage lockdown:temp args set value {range: 16}
execute store result storage lockdown:temp args.range int 1 run scoreboard players get @s lockdown.pursuit_range
function lockdown:devices/drone/patrolling/__detect_suspicious with storage lockdown:temp args

# Save position of interest (if one was found)
execute unless score lockdown.highest_priority lockdown.local matches -2147483648 run data modify entity @s data.suspect_pos set from storage lockdown:temp suspect_pos
scoreboard players reset lockdown.highest_priority lockdown.local

# Restore approval list from temporary copy
data modify entity @s data.approved set from storage lockdown:temp approved
data remove storage lockdown:temp approved
