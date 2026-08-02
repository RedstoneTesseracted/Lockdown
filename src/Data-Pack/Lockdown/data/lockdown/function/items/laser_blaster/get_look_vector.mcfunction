# Used by lockdown:items/laser_blaster/use to get player look vector
# This is run by a marker whose position contains the look vector

# Store look vector to storage
data modify storage lockdown:temp pos.x set from entity @s Pos[0]
data modify storage lockdown:temp pos.y set from entity @s Pos[1]
data modify storage lockdown:temp pos.z set from entity @s Pos[2]

# Remove temporary marker
kill @s[type=minecraft:marker]
