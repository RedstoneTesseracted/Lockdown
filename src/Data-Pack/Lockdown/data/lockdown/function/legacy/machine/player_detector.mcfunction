# This function upgrades a pre-R3 player-detector into an R3 one

# Spawn the intended item
function lockdown:drop/player_detector

# Cleanup blocks/legacy entities
setblock ~ ~ ~ minecraft:air
kill @s[type=minecraft:armor_stand]
