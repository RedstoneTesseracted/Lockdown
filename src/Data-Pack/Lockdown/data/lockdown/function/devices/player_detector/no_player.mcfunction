# This function handles the player detector ceasing to detect any players
tag @s remove lockdown.detected
data modify entity @s item.components."minecraft:item_model" set value "lockdown:machine/player_detector_off"
execute if block ~ ~ ~ minecraft:redstone_block run setblock ~ ~ ~ minecraft:red_terracotta
