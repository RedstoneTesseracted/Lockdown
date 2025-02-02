# Handles the removal of an alarm block
# This is run BY and AT the base alarm entity

# Destroy the incorrect item
kill @n[type=minecraft:item,distance=..1,nbt={Item:{id:"minecraft:acacia_button"}}]

# Spawn the base item to be configured
execute align xyz run summon minecraft:item ~0.5 ~0.5 ~0.5 {Item:{id:"minecraft:item_frame",components:{"minecraft:item_model":"lockdown:invisible","minecraft:item_name":'"If you can read this, something has gone wrong!"'}},Tags:["lockdown.item.configure"]}

# Configure item according to color
execute align xyz if entity @s[tag=lockdown.color.white] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/button/white_button
execute align xyz if entity @s[tag=lockdown.color.red] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/button/red_button
execute align xyz if entity @s[tag=lockdown.color.orange] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/button/orange_button
execute align xyz if entity @s[tag=lockdown.color.yellow] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/button/yellow_button
execute align xyz if entity @s[tag=lockdown.color.green] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/button/green_button
execute align xyz if entity @s[tag=lockdown.color.blue] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/button/blue_button
execute align xyz if entity @s[tag=lockdown.color.light_blue] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/button/light_blue_button
execute align xyz if entity @s[tag=lockdown.color.lime] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/button/lime_button
execute align xyz if entity @s[tag=lockdown.color.cyan] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/button/cyan_button
execute align xyz if entity @s[tag=lockdown.color.pink] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/button/pink_button
execute align xyz if entity @s[tag=lockdown.color.magenta] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/button/magenta_button
execute align xyz if entity @s[tag=lockdown.color.purple] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/button/purple_button
execute align xyz if entity @s[tag=lockdown.color.black] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/button/black_button
execute align xyz if entity @s[tag=lockdown.color.gray] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/button/gray_button
execute align xyz if entity @s[tag=lockdown.color.light_gray] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/button/light_gray_button
execute align xyz if entity @s[tag=lockdown.color.brown] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/button/brown_button

# Set channel data
execute store result entity @n[tag=lockdown.item.configure] Item.components."minecraft:entity_data".Item.components."minecraft:custom_data".lockdown_data.channel int 1.0 run scoreboard players get @s lockdown.channel
execute if score @s lockdown.channel matches 0 run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:set_no_channel_lore
execute if score @s lockdown.channel matches 1.. run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:set_channel_lore

# Update channels
tag @s remove lockdown.sending
function lockdown:channels/end_broadcast

# Common block removal functionality
function lockdown:devices/common_destroy

