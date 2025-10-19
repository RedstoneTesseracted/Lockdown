# This function is called whenever the player uses the legacy conversion wand

# Play effects
playsound minecraft:ui.button.click player @s ~ ~ ~ 1 1

# Search the player's inventory for items to upgrade
execute if items entity @s inventory.* *[minecraft:custom_data={LockdownItem:1b}] run function lockdown:legacy/convert_legacy_player_inventory

# Find the legacy block that the player was trying to interact with and drop it (if possible)
execute store result score lockdown.success lockdown.local run function lockdown:items/legacy_wand/raycast_search
