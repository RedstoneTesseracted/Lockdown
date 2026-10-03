# This function applies the berserker upgrade to a turret/drone

# Check if chosen entity is applicable for this upgrade
execute unless function lockdown:items/upgrade/checks/target_is_turret_or_drone run return run title @p[tag=lockdown.player_context] actionbar {translate: "lockdown.messages.upgrade.not_eligible",color: "red", with: [{translate: "item.lockdown.suspicious_thumb_drive"}]}
execute if function lockdown:items/upgrade/checks/max_berserker_upgrades run return 1

# Apply upgrade to chosen entity
# Note: context is ALWAYS the root block entity
tag @s add lockdown.behavior.berserker
execute at @s run particle minecraft:dust{color:[1.0,0.0,0.0],scale:1.0} ~ ~ ~ 0.25 0.25 0.25 0.1 10
execute at @s run playsound lockdown:entity.drone.glitch player @a ~ ~ ~ 1.0 1.0
rotate @s[tag=lockdown.drone] ~45 ~

# Clear approved entities list on drones
execute if entity @s[tag=lockdown.drone] run data modify entity @s data.approved set value []

return 0
