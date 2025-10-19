# This function upgrades a pre-R3 wireless transmitter into an R3 one

# Grab scores from armor stand
scoreboard players operation lockdown.channel lockdown.local = @s ld_channel

# Spawn the intended item
function lockdown:drop/wireless_transmitter

# Cleanup blocks/legacy entities
setblock ~ ~ ~ minecraft:air
kill @s[type=minecraft:armor_stand]
