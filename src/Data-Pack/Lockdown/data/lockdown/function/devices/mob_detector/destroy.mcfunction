# Remove the incorrect item
execute if entity @s[tag=lockdown.found_mob] run kill @n[type=minecraft:item,distance=..1,nbt={Item:{id:"minecraft:redstone_block"}}]
execute unless entity @s[tag=lockdown.found_mob] run kill @n[type=minecraft:item,distance=..1,nbt={Item:{id:"minecraft:red_terracotta"}}]

# Spawn the correct item
execute align xyz run loot spawn ~0.5 ~0.5 ~0.5 loot lockdown:item/mob_detector

# Common block removal functionality
function lockdown:devices/common_destroy
