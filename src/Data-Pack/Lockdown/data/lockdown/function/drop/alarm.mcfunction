# This drops and configures an alarm item at the current position.
#
# This may be run by either a device root entity or a placer entity.

# Make sure tag is clear, just in case
tag @e[tag=lockdown.item.configure] remove lockdown.item.configure

# Spawn the base item to be configured
execute align xyz run summon minecraft:item ~0.5 ~0.5 ~0.5 {Item:{id:"minecraft:item_frame",components:{"minecraft:item_model":"lockdown:invisible","minecraft:item_name":'"If you can read this, something has gone wrong!"'}},Tags:["lockdown.item.configure"]}

# Configure item according to color
# This should apply for both placer and device entities, as they use the same tags to denote color
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
execute store result entity @n[tag=lockdown.item.configure] Item.components."minecraft:entity_data".Item.components."minecraft:custom_data".lockdown_data.channel int 1.0 run scoreboard players get lockdown.channel lockdown.local
execute if score lockdown.channel lockdown.local matches 0 run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:set_no_channel_lore
execute if score lockdown.channel lockdown.local matches 1.. run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:set_channel_lore

# Randomize motion
execute as @n[tag=lockdown.item.configure] run function lockdown:drop/util/set_random_motion

# Unmark dropped item for configuration
tag @e[tag=lockdown.item.configure] remove lockdown.item.configure
