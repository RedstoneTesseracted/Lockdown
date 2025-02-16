# Checks if the entity marked by the "lockdown.context" already has the maximum number of durability upgrades

execute as @e[tag=lockdown.context,limit=1] if score @s lockdown.upgrades.durability >= lockdown.max_durability_upgrades lockdown.constant run return 1
return 0
