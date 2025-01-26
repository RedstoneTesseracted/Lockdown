# Remove the incorrect item
kill @n[type=minecraft:item,distance=..1,nbt={Item:{id:"minecraft:dispenser"}}]

# Spawn the encoder item
execute align xyz run loot spawn ~0.5 ~0.5 ~0.5 loot lockdown:item/encoding_station

# Common block removal functionality
function lockdown:devices/common_destroy

