# This drops and configures a control tower item at the current position.
#
# This may be run by either a device root entity or a placer entity.

# Make sure tag is clear, just in case
tag @e[tag=lockdown.item.configure] remove lockdown.item.configure

# Spawn the base item to be configured
#execute align xyz run summon minecraft:item ~0.5 ~0.5 ~0.5 {Item:{id:"minecraft:item_frame",components:{"minecraft:item_model":"lockdown:invisible","minecraft:item_name":'"If you can read this, something has gone wrong!"'}},Tags:["lockdown.item.configure"]}
#item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/control_tower
execute align xyz run loot spawn ~0.5 ~0.5 ~0.5 loot lockdown:legacy/control_tower_return


# Assign code
execute if score lockdown.channel lockdown.local matches 0 run data modify entity @n[tag=lockdown.item.configure] Item.components."minecraft:entity_data".data.lockdown_data.channel set value 0b
execute if score lockdown.channel lockdown.local matches 1.. store result entity @n[tag=lockdown.item.configure] Item.components."minecraft:entity_data".data.lockdown_data.channel int 1.0 run scoreboard players get lockdown.channel lockdown.local
execute if score lockdown.channel lockdown.local matches 0 run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:set_no_code_lore
execute if score lockdown.channel lockdown.local matches 1.. run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:set_code_lore

# Unmark dropped item for configuration
tag @e[tag=lockdown.item.configure] remove lockdown.item.configure
