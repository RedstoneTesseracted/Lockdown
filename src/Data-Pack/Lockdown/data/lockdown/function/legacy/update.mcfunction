# Call this function to update all lockdown devices in range, as well as all lockdown items in all player's inventories.

# Update all machines in range
execute as @e[type=minecraft:armor_stand,tag=ld_block] at @s run function lockdown:legacy/convert_device

# Update all items in all player's inventories
execute as @a run function lockdown:legacy/convert_inventory
