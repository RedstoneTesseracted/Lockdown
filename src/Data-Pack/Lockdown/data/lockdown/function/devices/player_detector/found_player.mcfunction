# This function handles the detection of a player by the player detector
tag @s add lockdown.detected
data modify entity @s item.components."minecraft:item_model" set value "lockdown:machine/player_detector_on"
execute if block ~ ~ ~ minecraft:red_terracotta run setblock ~ ~ ~ minecraft:redstone_block
