# This function destroys any block that isn't unmounted

execute if entity @s[tag=lockdown.direction.up] if block ~ ~1 ~ #minecraft:replaceable run return run function lockdown:devices/universal_destroy
execute if entity @s[tag=lockdown.direction.down] if block ~ ~-1 ~ #minecraft:replaceable run return run function lockdown:devices/universal_destroy
execute if entity @s[tag=lockdown.direction.north] if block ~ ~ ~-1 #minecraft:replaceable run return run function lockdown:devices/universal_destroy
execute if entity @s[tag=lockdown.direction.south] if block ~ ~ ~1 #minecraft:replaceable run return run function lockdown:devices/universal_destroy
execute if entity @s[tag=lockdown.direction.east] if block ~1 ~ ~ #minecraft:replaceable run return run function lockdown:devices/universal_destroy
execute if entity @s[tag=lockdown.direction.west] if block ~-1 ~ ~ #minecraft:replaceable run return run function lockdown:devices/universal_destroy
