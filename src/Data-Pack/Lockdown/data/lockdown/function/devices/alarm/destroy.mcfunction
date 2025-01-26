# Handles the removal of an alarm block
# This is run BY and AT the base alarm entity

# Spawn the base item to be configured
execute align xyz run summon minecraft:item ~0.5 ~0.5 ~0.5 {Item:{id:"minecraft:item_frame",components:{"minecraft:item_model":"lockdown:invisible","minecraft:item_name":'"If you can read this, something has gone wrong!"'}},Tags:["lockdown.item.configure"]}

# Configure item according to color
execute align xyz if entity @s[tag=lockdown.color.white] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/alarm/white_alarm
execute align xyz if entity @s[tag=lockdown.color.red] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/alarm/red_alarm
execute align xyz if entity @s[tag=lockdown.color.orange] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/alarm/orange_alarm
execute align xyz if entity @s[tag=lockdown.color.yellow] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/alarm/yellow_alarm
execute align xyz if entity @s[tag=lockdown.color.green] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/alarm/green_alarm
execute align xyz if entity @s[tag=lockdown.color.blue] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/alarm/blue_alarm
execute align xyz if entity @s[tag=lockdown.color.light_blue] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/alarm/light_blue_alarm
execute align xyz if entity @s[tag=lockdown.color.lime] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/alarm/lime_alarm
execute align xyz if entity @s[tag=lockdown.color.cyan] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/alarm/cyan_alarm
execute align xyz if entity @s[tag=lockdown.color.pink] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/alarm/pink_alarm
execute align xyz if entity @s[tag=lockdown.color.magenta] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/alarm/magenta_alarm
execute align xyz if entity @s[tag=lockdown.color.purple] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/alarm/purple_alarm
execute align xyz if entity @s[tag=lockdown.color.black] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/alarm/black_alarm
execute align xyz if entity @s[tag=lockdown.color.gray] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/alarm/gray_alarm
execute align xyz if entity @s[tag=lockdown.color.light_gray] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/alarm/light_gray_alarm
execute align xyz if entity @s[tag=lockdown.color.brown] run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/alarm/brown_alarm

# Set channel data
execute store result entity @n[tag=lockdown.item.configure] Item.components."minecraft:entity_data".Item.components."minecraft:custom_data".lockdown_data.channel int 1.0 run scoreboard players get @s lockdown.channel
execute if score @s lockdown.channel matches 0 run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:set_no_channel_lore
execute if score @s lockdown.channel matches 1.. run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:set_channel_lore

# Common block removal functionality
function lockdown:devices/common_destroy
