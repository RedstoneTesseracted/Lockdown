# Copies the execution entity's position to storage and destroys said execution entity

data modify storage lockdown:temp pos.x set from entity @s Pos[0]
data modify storage lockdown:temp pos.y set from entity @s Pos[1]
data modify storage lockdown:temp pos.z set from entity @s Pos[2]
kill @s[type=minecraft:marker]
