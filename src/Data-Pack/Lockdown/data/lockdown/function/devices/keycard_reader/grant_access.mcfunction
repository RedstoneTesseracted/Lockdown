# Handles the keycard reader accepting a keycard and outputting a redstone signal

# Update state tags
tag @s add lockdown.powered

# Update model
data modify entity @s[tag=lockdown.block.display] item.components."minecraft:item_model" set value "lockdown:machine/keycard_reader_on"

# Play effects
playsound minecraft:entity.experience_orb.pickup block @a ~ ~ ~ 1.0 2
particle minecraft:happy_villager ~ ~0.5 ~ 0.25 0.25 0.25 0 2

# Update redstone output
setblock ~ ~ ~ minecraft:redstone_block
