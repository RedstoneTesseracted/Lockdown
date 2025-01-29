# This function handles the keycard reader ending its "accept" state

# Update state tags
tag @s remove lockdown.powered

# Update model
data modify entity @s[tag=lockdown.block.display] item.components."minecraft:item_model" set value "lockdown:machine/keycard_reader_off"

# Update redstone output
setblock ~ ~ ~ minecraft:red_terracotta
