# Recursive function used by convert_legacy_player_inventory to loop through the player's inventory

# Ignore anything that isn't a legacy lockdown item in a standard player inventory slot
scoreboard players set lockdown.skip lockdown.local 0
execute unless data storage lockdown:temp items_copy[0].Slot run scoreboard players set lockdown.skip lockdown.local 1
execute store result score lockdown.slot lockdown.local run data get storage lockdown:temp items_copy[0].Slot
execute unless score lockdown.slot lockdown.local matches 0..35 run scoreboard players set lockdown.skip lockdown.local 1
execute unless data storage lockdown:temp items_copy[0].components."minecraft:custom_data".LockdownData run scoreboard players set lockdown.skip lockdown.local 1
execute if score lockdown.skip lockdown.local matches 1 run data remove storage lockdown:temp items_copy[0]
execute if score lockdown.skip lockdown.local matches 1 if data storage lockdown:temp items_copy[0] run return run function lockdown:legacy/__convert_legacy_player_inventory
execute unless data storage lockdown:temp items_copy[0] run return 1

# Process slot
data modify storage lockdown:temp item set from storage lockdown:temp items_copy[0]
data remove storage lockdown:temp item.Slot
function lockdown:legacy/process_item

# Return item to player's inventory slot
# This could either be in the hotbar (slots 0-8) or the inventory (slots 9-35)
data modify storage lockdown:temp args set value {slot: -1, type: ""}
execute if score lockdown.slot lockdown.local matches ..8 run data modify storage lockdown:temp args.type set value "hotbar"
execute if score lockdown.slot lockdown.local matches 9.. run data modify storage lockdown:temp args.type set value "inventory"
execute if score lockdown.slot lockdown.local matches 9.. run scoreboard players remove lockdown.slot lockdown.local 9
execute store result storage lockdown:temp args.slot int 1 run scoreboard players get lockdown.slot lockdown.local
execute store result score lockdown.result lockdown.local run function lockdown:legacy/restore_slot_macro with storage lockdown:temp args
execute if score lockdown.result lockdown.local matches 0 run title @p[tag=lockdown.legacy.context] actionbar {translate: "lockdown.messages.bug.macro.generic", color: "red", with: [{text: "lockdown:legacy/restore_slot_macro", underlined: true, color: "gray"}]}
item replace entity @s container.0 with minecraft:air

# Run again if entries remain
data remove storage lockdown:temp items_copy[0]
execute if data storage lockdown:temp items_copy[0] run function lockdown:legacy/__convert_legacy_player_inventory



