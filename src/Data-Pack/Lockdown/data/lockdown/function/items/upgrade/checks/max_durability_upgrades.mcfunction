# Checks if the current entity already has the maximum number of durability upgrades

execute if score @s lockdown.upgrades.durability >= lockdown.max_durability_upgrades lockdown.constant run return 1
return 0
