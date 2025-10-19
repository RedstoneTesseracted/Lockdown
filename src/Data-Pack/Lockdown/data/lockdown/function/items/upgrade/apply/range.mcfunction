# This function applies the range upgrade to a turret/drone

# Check if chosen entity is applicable for this upgrade
execute unless function lockdown:items/upgrade/checks/target_is_turret_or_drone run return run title @s actionbar {translate: "lockdown.messages.upgrade.not_eligible",color: "red", with: [{translate: "item.lockdown.upgrade.range"}]}
execute if function lockdown:items/upgrade/checks/max_range_upgrades run return run title @s actionbar {translate: "lockdown.messages.upgrade.max_upgraded",color: "red", with: [{translate: "item.lockdown.upgrade.range"}]}

# Apply upgrade to chosen entity
# Note: context is ALWAYS the root block entity
scoreboard players add @e[tag=lockdown.context,limit=1] lockdown.upgrades.range 1
scoreboard players add @e[tag=lockdown.context,limit=1] lockdown.firing_range 2
scoreboard players add @e[tag=lockdown.context,limit=1] lockdown.firing_enter_range 2
scoreboard players add @e[tag=lockdown.context,limit=1] lockdown.firing_exit_range 2
scoreboard players add @e[tag=lockdown.context,limit=1] lockdown.pursuit_enter_range 2
scoreboard players add @e[tag=lockdown.context,limit=1] lockdown.pursuit_exit_range 2
execute at @e[tag=lockdown.context,limit=1] run particle minecraft:happy_villager ~ ~ ~ 0.25 0.25 0.25 0.1 10

return 0
