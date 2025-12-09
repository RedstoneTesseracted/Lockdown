# Checks if the current entity already has the maximum number of control tower upgrades

execute if entity @s[tag=lockdown.behavior.control_tower] run return 1
return 0
