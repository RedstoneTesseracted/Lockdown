# This function handles assigning the code/channel to the item in the slot.
# Channel implementation varies by the item due to technical limitations,
# so this wraps all the branching logic.

# Set channel in item data
execute store result storage lockdown:temp channel int 1 run scoreboard players get lockdown.channel lockdown.local

# Keycards
execute if items entity @s container.0 *[minecraft:custom_data~{lockdown_data:{group:"keycards"}}] run data modify entity @s item.components."minecraft:custom_data".lockdown_data.channel set from storage lockdown:temp channel
execute if items entity @s container.0 *[minecraft:custom_data~{lockdown_data:{group:"keycards"}}] run return 1

# Key
execute if items entity @s container.0 *[minecraft:custom_data~{lockdown_data:{name:"key"}}] run data modify entity @s item.components."minecraft:custom_data".lockdown_data.channel set from storage lockdown:temp channel
execute if items entity @s container.0 *[minecraft:custom_data~{lockdown_data:{name:"key"}}] run return 1

# Custom blocks where the channel is stored on the item frame's item
execute if data entity @s item.components."minecraft:entity_data".Item.components."minecraft:custom_data".lockdown_data.channel run data modify entity @s item.components."minecraft:entity_data".Item.components."minecraft:custom_data".lockdown_data.channel set from storage lockdown:temp channel
execute if data entity @s item.components."minecraft:entity_data".Item.components."minecraft:custom_data".lockdown_data.channel run return 1

# Custom blocks where the channel is stored in the marker's data
execute if data entity @s item.components."minecraft:entity_data".data.lockdown_data.channel run data modify entity @s item.components."minecraft:entity_data".data.lockdown_data.channel set from storage lockdown:temp channel
execute if data entity @s item.components."minecraft:entity_data".data.lockdown_data.channel run return 1

# Failed to encode item: not a recognized case
return fail
