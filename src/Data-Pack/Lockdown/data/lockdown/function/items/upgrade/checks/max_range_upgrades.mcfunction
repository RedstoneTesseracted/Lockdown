# Checks if the current entity already has the maximum number of range upgrades

execute if score @s lockdown.upgrades.range >= lockdown.max_range_upgrades lockdown.constant run return 1
return 0
