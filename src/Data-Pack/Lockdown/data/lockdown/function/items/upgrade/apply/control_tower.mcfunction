# This function applies the control tower upgrade to a drone

# Check if chosen entity is applicable for this upgrade
execute unless function lockdown:items/upgrade/checks/target_is_drone run return run title @s actionbar {"translate": "lockdown.messages.upgrade.not_eligible","color": "red", "with": [{"translate": "item.lockdown.upgrade.control_tower"}]}
execute if function lockdown:items/upgrade/checks/max_control_tower_upgrades run return run title @s actionbar {"translate": "lockdown.messages.upgrade.max_upgraded","color": "red", "with": [{"translate": "item.lockdown.upgrade.control_tower"}]}

# Apply upgrade to chosen entity
# Note: context is ALWAYS the root block entity
tag @e[tag=lockdown.context,limit=1] add lockdown.behavior.control_tower
execute at @e[tag=lockdown.context,limit=1] run particle minecraft:happy_villager ~ ~ ~ 0.25 0.25 0.25 0.1 10

return 0
