# This function loops through the player's inventory and converts all legacy items
# This is run BY and AT the player who's inventory will be converted

# Summon a temporary entity for storing items so future commands can have a consistent slot to target
summon minecraft:item_display ~ ~ ~ {Tags:["lockdown.item_converter"], transformation: [0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f]}

# Use a recursive loop to run through the player's inventory
tag @a[tag=lockdown.legacy.context] remove lockdown.legacy.context
tag @s add lockdown.legacy.context
data modify storage lockdown:temp items_copy set from entity @s Inventory
execute as @n[tag=lockdown.item_converter] run function lockdown:legacy/__convert_legacy_player_inventory
tag @s remove lockdown.legacy.context

# Clean up
data remove storage lockdown:temp items_copy
data remove storage lockdown:temp item
kill @e[type=minecraft:item_display,tag=lockdown.item_converter]
