# Checks if the entity marked by the "lockdown.context" already has the maximum number of flamethrower upgrades

execute as @e[tag=lockdown.context,limit=1] if entity @s[tag=lockdown.behavior.flamethrower] run return 1
return 0
