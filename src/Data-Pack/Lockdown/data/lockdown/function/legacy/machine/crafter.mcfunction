# Secure crafters were removed in R3, so this just returns the crafting ingredients

# Destroy block to ensure contents are ejected
setblock ~ ~ ~ minecraft:air destroy
kill @e[type=minecraft:item,nbt={Item:{components: {"minecraft:custom_data": {LockdownDelete: 1b}}}}]

# Return ingredients
loot spawn ~ ~ ~ loot lockdown:legacy/crafter_return

# Remove legacy entities
kill @s[type=minecraft:armor_stand]
