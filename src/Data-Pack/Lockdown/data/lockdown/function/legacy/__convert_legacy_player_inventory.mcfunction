# Recursive function used by convert_legacy_player_inventory to loop through the player's inventory

# Ignore anything that isn't a legacy lockdown item in a standard player inventory slot
scoreboard players set lockdown.skip lockdown.local 0
execute unless data storage lockdown:temp items_copy[0].Slot run scoreboard players set lockdown.proceed lockdown.local 1
execute unless data storage lockdown:temp items_copy[0].components."minecraft:custom_data".LockdownData run scoreboard players set lockdown.proceed lockdown.local 1
execute if score lockdown.skip lockdown.local matches 1 run function lockdown:legacy/__convert_legacy_player_inventory

# Process slot
data modify storage lockdown:temp item set from storage lockdown:temp items_copy[0]
data remove storage lockdown:temp item.Slot
function lockdown:legacy/process_item

# Return item to player's inventory slot
data modify storage lockdown:temp args set value {slot: -1b}
data modify storage lockdown:temp args.slot set from storage lockdown:temp items_copy[0].Slot
function lockdown:legacy/restore_slot_macro with storage lockdown:temp args
item replace entity @s container.0 with minecraft:air

# Run again if entries remain
execute if data storage lockdown:temp items_copy[0] run function lockdown:legacy/__convert_legacy_player_inventory
