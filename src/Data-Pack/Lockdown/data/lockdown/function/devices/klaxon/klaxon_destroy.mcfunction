# Remove the incorrect item
kill @n[type=minecraft:item,distance=..1,nbt={Item:{id:"minecraft:redstone_lamp"}}]

# Spawn the correct item
execute align xyz run loot spawn ~0.5 ~0.5 ~0.5 loot lockdown:item/klaxon

# Common block removal functionality
function lockdown:devices/common_destroy
