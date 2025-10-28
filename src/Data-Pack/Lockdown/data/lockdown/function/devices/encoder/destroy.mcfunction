# Remove the incorrect item
kill @n[type=minecraft:item,distance=..1,nbt={Item:{id:"minecraft:dropper"}}]
kill @e[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{lockdown_data:{forbidden:1b}}}}}]

# Spawn the encoder item
function lockdown:drop/encoder

# Common block removal functionality
function lockdown:devices/common_destroy

