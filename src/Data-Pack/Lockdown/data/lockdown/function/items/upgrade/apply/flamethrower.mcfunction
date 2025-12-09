# This function applies the flamethrower upgrade to a turret/drone

# Check if chosen entity is applicable for this upgrade
execute unless function lockdown:items/upgrade/checks/target_is_turret_or_drone run return run title @p[tag=lockdown.player_context] actionbar {translate: "lockdown.messages.upgrade.not_eligible",color: "red", with: [{translate: "item.lockdown.upgrade.flamethrower"}]}
execute if function lockdown:items/upgrade/checks/max_flamethrower_upgrades run return run title @p[tag=lockdown.player_context] actionbar {translate: "lockdown.messages.upgrade.max_upgraded",color: "red", with: [{translate: "item.lockdown.upgrade.flamethrower"}]}

# Apply upgrade to chosen entity
# Note: context is ALWAYS the root block entity
tag @s add lockdown.behavior.flamethrower
execute at @s run particle minecraft:happy_villager ~ ~ ~ 0.25 0.25 0.25 0.1 10

return 0
