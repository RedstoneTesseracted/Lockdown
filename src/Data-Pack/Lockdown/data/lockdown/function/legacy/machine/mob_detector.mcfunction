# This function upgrades a pre-R3 mob-detector into an R3 one

# Spawn the intended item
function lockdown:drop/mob_detector

# Cleanup blocks/legacy entities
setblock ~ ~ ~ minecraft:air
kill @s[type=minecraft:armor_stand]
