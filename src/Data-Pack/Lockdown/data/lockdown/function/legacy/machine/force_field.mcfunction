# This function upgrades a pre-R3 wireless transmitter into an R3 one

# Clear out barrier blocks
execute if entity @s[tag=ld_projecting] run function lockdown:legacy/machine/force_field_clear

# Spawn the intended item
function lockdown:drop/force_field_projector

# Cleanup blocks/legacy entities
setblock ~ ~ ~ minecraft:air
kill @s[type=minecraft:armor_stand]
