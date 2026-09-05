# This function returns whether the entity that ran it can be painted

execute if entity @s[type=minecraft:item_display,tag=lockdown.drone] run return 1
execute if entity @s[type=minecraft:item_display,tag=lockdown.laser_cannon] run return 1
return 0
