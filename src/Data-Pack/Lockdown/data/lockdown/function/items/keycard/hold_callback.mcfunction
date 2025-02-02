# This function is used to update the player's "held channel" score
# whenever they're holding a keycard
# It is called using an advancement trigger

# Update score
execute if predicate lockdown:keycard_offhand store result score @s lockdown.held_channel run data get entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".lockdown_data.channel
execute if predicate lockdown:keycard_mainhand store result score @s lockdown.held_channel run data get entity @s SelectedItem.components."minecraft:custom_data".lockdown_data.channel

# Reset advancement trigger
advancement revoke @s only lockdown:hidden/hold_keycard
