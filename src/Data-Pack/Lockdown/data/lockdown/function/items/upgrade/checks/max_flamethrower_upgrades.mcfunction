# Checks if the current entity already has the maximum number of flamethrower upgrades

execute if entity @s[tag=lockdown.behavior.flamethrower] run return 1
return 0
