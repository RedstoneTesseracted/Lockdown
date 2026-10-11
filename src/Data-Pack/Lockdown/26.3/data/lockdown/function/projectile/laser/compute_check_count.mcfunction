# Post-26.3 implementation
#
# This function calculates the number of checks that need to be performed by check_collisions_along_trail.
# This is done by dividing the distance traveled since last tick by 0.2.
#
# This uses context float providers instead of the jank method involving display entities from older versions.
# This should hopefully make this calculation more performant in newer versions.
#
# N = sqrt((Pos[0] - last_x/71.5)^2 + (Pos[1] - last_y/71.5)^2 + (Pos[2] - last_z/71.5)^2) / 0.2

# Write data to temporary storage
data modify storage lockdown:temp args set value {x1: 0.0f, x2: 0.0f, y1: 0.0f, y2: 0.0f, z1: 0.0f, z2: 0.0f}
execute store result storage lockdown:temp args.x1 float 0.013986013986013986 run scoreboard players get @s lockdown.last_x
execute store result storage lockdown:temp args.y1 float 0.013986013986013986 run scoreboard players get @s lockdown.last_y
execute store result storage lockdown:temp args.z1 float 0.013986013986013986 run scoreboard players get @s lockdown.last_z
data modify storage lockdown:temp args.x2 set from entity @s Pos[0]
data modify storage lockdown:temp args.y2 set from entity @s Pos[1]
data modify storage lockdown:temp args.z2 set from entity @s Pos[2]

# Perform calculation and write to score
execute store result score lockdown.count lockdown.local run compute default float lockdown:compute_check_count
