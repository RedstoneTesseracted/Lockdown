# Run by a temporary marker to save the exact current position for a function macro later

data modify storage lockdown:temp args.x set from entity @s Pos[0]
data modify storage lockdown:temp args.y set from entity @s Pos[1]
data modify storage lockdown:temp args.z set from entity @s Pos[2]
kill @s[type=minecraft:marker]
