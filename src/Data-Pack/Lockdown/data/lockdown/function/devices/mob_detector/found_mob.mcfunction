# This function handles the detection of a mob by the mob detector
tag @s add lockdown.detected
data modify entity @s item.components."minecraft:item_model" set value "lockdown:machine/mob_detector_on"
execute if block ~ ~ ~ minecraft:red_terracotta run setblock ~ ~ ~ minecraft:redstone_block
