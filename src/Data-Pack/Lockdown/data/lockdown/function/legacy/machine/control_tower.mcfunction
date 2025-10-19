# Control towers don't exist in R3, so this just returns the crafting ingredients

setblock ~ ~ ~ minecraft:air
loot spawn ~ ~ ~ loot lockdown:legacy/control_tower_return
kill @s[type=minecraft:armor_stand]
