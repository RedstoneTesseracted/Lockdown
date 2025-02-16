# Checks if the entity marked by the "lockdown.context" already has the maximum number of control tower upgrades

execute as @e[tag=lockdown.context,limit=1] if entity @s[tag=lockdown.behavior.control_tower] run return 1
return 0
