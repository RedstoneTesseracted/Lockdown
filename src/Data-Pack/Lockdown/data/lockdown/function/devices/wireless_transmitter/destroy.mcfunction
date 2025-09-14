# Remove the incorrect item
kill @n[type=minecraft:item,distance=..1,nbt={Item:{id:"minecraft:redstone_lamp"}}]

# Spawn the correct item
scoreboard players operation lockdown.channel lockdown.local = @s lockdown.channel
function lockdown:drop/wireless_transmitter

# Common block removal functionality
function lockdown:channels/end_broadcast
function lockdown:devices/common_destroy
