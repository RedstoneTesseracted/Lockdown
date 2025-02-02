# Handles the detection of a signal.
# Update state tags, model, and redstone output

tag @s add lockdown.powered
data modify entity @s[tag=lockdown.block.display] item.components."minecraft:item_model" set value "lockdown:machine/receiver_on"
execute if block ~ ~ ~ minecraft:red_terracotta run setblock ~ ~ ~ minecraft:redstone_block
