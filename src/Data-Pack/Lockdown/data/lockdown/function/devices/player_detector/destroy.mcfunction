# Remove the incorrect item
execute if entity @s[tag=lockdown.found_mob] run kill @n[type=minecraft:item,distance=..1,nbt={Item:{id:"minecraft:redstone_block"}}]
execute unless entity @s[tag=lockdown.found_mob] run kill @n[type=minecraft:item,distance=..1,nbt={Item:{id:"minecraft:red_terracotta"}}]

# Spawn the correct item
function lockdown:drop/player_detector

# Common block removal functionality
function lockdown:devices/common_destroy
