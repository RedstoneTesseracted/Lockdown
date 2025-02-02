# Handles the detection of a signal.
# Update state tags, model, and redstone output

tag @s remove lockdown.powered
data modify entity @s[tag=lockdown.block.display] item.components."minecraft:item_model" set value "lockdown:machine/receiver_off"
execute if block ~ ~ ~ minecraft:redstone_block run setblock ~ ~ ~ minecraft:red_terracotta
