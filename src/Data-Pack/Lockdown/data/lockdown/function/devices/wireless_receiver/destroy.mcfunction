# Remove the incorrect item
execute if entity @s[tag=lockdown.receiving] run kill @n[type=minecraft:item,distance=..1,nbt={Item:{id:"minecraft:redstone_block"}}]
execute unless entity @s[tag=lockdown.receiving] run kill @n[type=minecraft:item,distance=..1,nbt={Item:{id:"minecraft:glass"}}]

# Spawn the correct item
execute align xyz run summon minecraft:item ~0.5 ~0.5 ~0.5 {Item:{id:"minecraft:pig_spawn_egg",components:{"minecraft:item_name":'"If you can read this, something has gone wrong!"'}},Tags:["lockdown.item.configure"]}
item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:item/wireless_receiver

# Assign code
execute if score @s lockdown.channel matches 0 run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:set_no_channel_lore
execute if score @s lockdown.channel matches 1.. run item modify entity @n[tag=lockdown.item.configure] container.0 lockdown:set_channel_lore

# Common block removal functionality
function lockdown:devices/common_destroy
