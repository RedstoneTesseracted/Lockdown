# This function processes a single item for conversion
# Item data should be located in the "item" tag of the "lockdown:temp" storage.
#
# This is run BY an item display to make targeting with item modifiers easier

# Copy item from tag to self
data modify entity @s item set from storage lockdown:temp item

# Obtain item ID and channel data
execute store result score lockdown.legacy_model_id lockdown.local run data get storage lockdown:temp item.components."minecraft:custom_data".LockdownData.item_model
execute store result score lockdown.legacy_item_id lockdown.local run data get storage lockdown:temp item.components."minecraft:custom_data".LockdownData.id
execute store result score lockdown.channel lockdown.local run data get storage lockdown:temp item.components."minecraft:custom_data".LockdownData.channel
execute store result score lockdown.legacy_upgrade_id lockdown.local run data get storage lockdown:temp item.components."minecraft:custom_data".LockdownData.upgrade_id

# Item ID map:
#  1: Heavy duty leaver (never implemented)
#  2: Keypad (never implemented)
#  3: Keycard reader
#  4: Keycard
#  5: Alarms
#  6: Big buttons
#  7: Drone
#  8: Player detector
#  9: Mob detector
# 10: Klaxon
# 11: Laser projector
# 12: Wireless transmitter
# 13: Wireless receiver
# 14: Force field projector
# 15: Laser turret
# 16: Encoding station
# 17: Secure Crafting Table
# 18: Secure Recipe Book
# 19: Drone control tower
#
# Upgrade IDs (items with upgrade: 1b):
#  1: Drone control tower upgrade
#  2: Durability upgrade
#  3: Flamethrower upgrade

# Handle regular items
execute if score lockdown.legacy_item_id lockdown.local matches 3 run loot replace entity @s container.0 loot lockdown:item/keycard_reader
execute if score lockdown.legacy_item_id lockdown.local matches 4 run loot replace entity @s container.0 loot lockdown:item/keycard/keycard
execute if score lockdown.legacy_item_id lockdown.local matches 5 run function lockdown:legacy/process_alarm
execute if score lockdown.legacy_item_id lockdown.local matches 6 run function lockdown:legacy/process_button
execute if score lockdown.legacy_item_id lockdown.local matches 7 run loot replace entity @s container.0 loot lockdown:item/drone
execute if score lockdown.legacy_item_id lockdown.local matches 8 run loot replace entity @s container.0 loot lockdown:item/player_detector
execute if score lockdown.legacy_item_id lockdown.local matches 9 run loot replace entity @s container.0 loot lockdown:item/mob_detector
execute if score lockdown.legacy_item_id lockdown.local matches 10 run loot replace entity @s container.0 loot lockdown:item/klaxon
execute if score lockdown.legacy_item_id lockdown.local matches 11 run loot replace entity @s container.0 loot lockdown:item/laser_projector
execute if score lockdown.legacy_item_id lockdown.local matches 12 run loot replace entity @s container.0 loot lockdown:item/wireless_transmitter
execute if score lockdown.legacy_item_id lockdown.local matches 13 run loot replace entity @s container.0 loot lockdown:item/wireless_receiver
execute if score lockdown.legacy_item_id lockdown.local matches 14 run loot replace entity @s container.0 loot lockdown:item/force_field_projector
execute if score lockdown.legacy_item_id lockdown.local matches 15 run loot replace entity @s container.0 loot lockdown:item/turret
execute if score lockdown.legacy_item_id lockdown.local matches 16 run loot replace entity @s container.0 loot lockdown:item/encoding_station
execute if score lockdown.legacy_item_id lockdown.local matches 17 run loot spawn ~ ~ ~ loot lockdown:legacy/crafter_return
execute if score lockdown.legacy_item_id lockdown.local matches 17 run item replace entity @s container.0 with minecraft:air
execute if score lockdown.legacy_item_id lockdown.local matches 18 run loot spawn ~ ~ ~ loot lockdown:legacy/recipe_book_return
execute if score lockdown.legacy_item_id lockdown.local matches 18 run item replace entity @s container.0 with minecraft:air
execute if score lockdown.legacy_item_id lockdown.local matches 19 run loot spawn ~ ~ ~ loot lockdown:legacy/control_tower_return
execute if score lockdown.legacy_item_id lockdown.local matches 19 run item replace entity @s container.0 with minecraft:air

# Apply channel/code
execute if data entity @s item.components."minecraft:custom_data".lockdown_data{encodable: true} run function lockdown:legacy/process_channel

# Handle upgrades
execute if score lockdown.legacy_upgrade_id lockdown.local matches 1 run loot spawn ~ ~ ~ loot lockdown:legacy/control_tower_upgrade_return
execute if score lockdown.legacy_upgrade_id lockdown.local matches 1 run item replace entity @s container.0 with minecraft:air
execute if score lockdown.legacy_upgrade_id lockdown.local matches 2 run loot replace entity @s container.0 loot lockdown:item/durability_upgrade
execute if score lockdown.legacy_upgrade_id lockdown.local matches 3 run loot replace entity @s container.0 loot lockdown:item/flamethrower_upgrade

# Copy over item count
data modify entity @s item.count set from storage lockdown:temp item.count

