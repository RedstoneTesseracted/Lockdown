# Handles the removal of a turret
# This is run BY and AT the base turret entity

# Spawn the base item to be configured
execute align xyz run summon minecraft:item ~0.5 ~0.5 ~0.5 {Item:{id:"minecraft:item_frame",components:{"minecraft:item_model":"lockdown:invisible","minecraft:item_name":'"If you can read this, something has gone wrong!"'}},Tags:["lockdown.item.configure"]}

# Convert item to turret
item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/turret

# Set channel data
execute store result entity @n[tag=lockdown.item.configure] Item.components."minecraft:entity_data".Item.components."minecraft:custom_data".lockdown_data.channel int 1.0 run scoreboard players get @s lockdown.channel
execute if score @s lockdown.channel matches 0 run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:set_no_channel_lore
execute if score @s lockdown.channel matches 1.. run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:set_channel_lore

# Common block removal functionality
function lockdown:devices/common_destroy
