# Common function used during the block destruction process that drops any applied upgrades
# This is run BY and AT the root block entity, and is called from lockdown:devices/common_destroy

execute if entity @s[tag=lockdown.behavior.flamethrower] run loot spawn ~ ~ ~ loot lockdown:item/flamethrower_upgrade
execute if entity @s[tag=lockdown.behavior.control_tower] run loot spawn ~ ~ ~ loot lockdown:item/control_tower_upgrade
execute if score @s lockdown.upgrades.range matches 1.. run loot spawn ~ ~ ~ loot lockdown:multiple_drops/range_upgrades
execute if score @s lockdown.upgrades.durability matches 1.. run loot spawn ~ ~ ~ loot lockdown:multiple_drops/durability_upgrades
