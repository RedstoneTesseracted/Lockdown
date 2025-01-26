# Secure crafters are considered obsolete, and will be removed.
# The items used to craft one will be returned.

setblock ~ ~ ~ minecraft:air
loot spawn ~ ~ ~ loot lockdown:legacy/crafter_return
kill @s[tag=ld_crafter]
