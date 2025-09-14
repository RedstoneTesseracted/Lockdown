# Remove the incorrect item
kill @n[type=minecraft:item,distance=..1,nbt={Item:{id:"minecraft:glass"}}]

# Spawn the correct item
scoreboard players operation lockdown.channel lockdown.local = @s lockdown.channel
function lockdown:drop/control_tower

# Common block removal functionality
function lockdown:devices/common_destroy
