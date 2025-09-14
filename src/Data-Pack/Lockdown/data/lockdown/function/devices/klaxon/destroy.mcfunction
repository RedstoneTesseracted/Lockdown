# Remove the incorrect item
kill @n[type=minecraft:item,distance=..1,nbt={Item:{id:"minecraft:redstone_lamp"}}]

# Spawn the correct item
function lockdown:drop/klaxon

# Common block removal functionality
function lockdown:devices/common_destroy
