# This function upgrades a pre-R3 klaxon into an R3 one

# Spawn the intended item
function lockdown:drop/klaxon

# Cleanup blocks/legacy entities
setblock ~ ~ ~ minecraft:air
kill @s[type=minecraft:armor_stand]
