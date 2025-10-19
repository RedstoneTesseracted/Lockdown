# This function handles assigning the code/channel to the item in the slot.
# Channel implementation varies by the item due to technical limitations,
# so this wraps all the branching logic.

# Keycards
execute if items block ~ ~ ~ container.4 *[minecraft:custom_data~{lockdown_data:{group:"keycards"}}] run data modify block ~ ~ ~ Items[{Slot:4b}].components."minecraft:custom_data".lockdown_data.channel set from storage lockdown:temp channel
execute if items block ~ ~ ~ container.4 *[minecraft:custom_data~{lockdown_data:{group:"keycards"}}] run return 1

# Key
execute if items block ~ ~ ~ container.4 *[minecraft:custom_data~{lockdown_data:{name:"key"}}] run data modify block ~ ~ ~ Items[{Slot:4b}].components."minecraft:custom_data".lockdown_data.channel set from storage lockdown:temp channel
execute if items block ~ ~ ~ container.4 *[minecraft:custom_data~{lockdown_data:{name:"key"}}] run return 1

# Custom blocks where the channel is stored on the item frame's item
execute if data block ~ ~ ~ Items[{Slot:4b}].components."minecraft:entity_data".Item.components."minecraft:custom_data".lockdown_data.channel run data modify block ~ ~ ~ Items[{Slot:4b}].components."minecraft:entity_data".Item.components."minecraft:custom_data".lockdown_data.channel set from storage lockdown:temp channel
execute if data block ~ ~ ~ Items[{Slot:4b}].components."minecraft:entity_data".Item.components."minecraft:custom_data".lockdown_data.channel run return 1

# Custom blocks where the channel is stored in the marker's data
execute if data block ~ ~ ~ Items[{Slot:4b}].components."minecraft:entity_data".data.lockdown_data.channel run data modify block ~ ~ ~ Items[{Slot:4b}].components."minecraft:entity_data".data.lockdown_data.channel set from storage lockdown:temp channel
execute if data block ~ ~ ~ Items[{Slot:4b}].components."minecraft:entity_data".data.lockdown_data.channel run return 1

# Failed to encode item: not a recognized case
return fail
