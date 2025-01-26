# Remove the incorrect item
kill @e[type=item,distance=..1,limit=1,sort=nearest,nbt={Item:{id:"minecraft:dispenser"}}]

# Spawn the encoder item
loot spawn ~ ~ ~ loot lockdown:item/encoding_station

# Apply the generic custom block removal
function lockdown:devices/generic_destroy
