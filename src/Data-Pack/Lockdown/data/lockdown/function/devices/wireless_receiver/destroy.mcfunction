# Remove the incorrect item
execute if entity @s[tag=lockdown.channel.receiving] run kill @n[type=minecraft:item,distance=..1,nbt={Item:{id:"minecraft:redstone_block"}}]
execute unless entity @s[tag=lockdown.channel.receiving] run kill @n[type=minecraft:item,distance=..1,nbt={Item:{id:"minecraft:glass"}}]

# Spawn the correct item
scoreboard players operation lockdown.channel lockdown.local = @s lockdown.channel
function lockdown:drop/wireless_receiver

# Common block removal functionality
function lockdown:devices/common_destroy
