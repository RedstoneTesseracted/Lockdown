# This function upgrades a pre-R3 keycard reader into an R3 one

# Obtain scores from the block
scoreboard players operation lockdown.channel lockdown.local = @s ld_channel

# Spawn the intended item
function lockdown:drop/keycard_reader

# Destroy legacy block/entities
setblock ~ ~ ~ minecraft:air
kill @s[type=minecraft:armor_stand]
