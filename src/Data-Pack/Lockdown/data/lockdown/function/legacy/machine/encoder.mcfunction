# This function upgrades a pre-R3 encoder into an R3 one

# Destroy the block so that contents are ejected
setblock ~ ~ ~ minecraft:air destroy
kill @e[type=minecraft:item,nbt={Item:{components: {"minecraft:custom_data": {LockdownDelete: 1b}}}}]

# Spawn the intended item
function lockdown:drop/encoder

# Cleanup legacy entities
kill @s[type=minecraft:armor_stand]
