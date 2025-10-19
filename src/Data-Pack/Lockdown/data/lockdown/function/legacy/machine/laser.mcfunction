# This function upgrades a pre-R3 laser projector into an R3 one

# Spawn the intended item
function lockdown:drop/laser_projector

# Cleanup blocks/legacy entities
setblock ~ ~ ~ minecraft:air
kill @s[type=minecraft:armor_stand]
