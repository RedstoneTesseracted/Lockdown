# This function evaluates whether the entity that ran it should be targetable by a turret

# Do not target technical entities
execute if entity @s[type=#lockdown:detection_ignore] run return 0

# Do not target creative/spectator players
execute if predicate lockdown:creative_or_spectator run return 0

# Hostile mobs are always valid targets, unless in berserker mode
execute unless score lockdown.is_berserker lockdown.local matches 1 if entity @s[type=#lockdown:hostile] run return 1

# Deny targetable entities with non-matching channel (if applicable)
execute if score lockdown.channel lockdown.local matches 0 if entity @s[tag=lockdown.behavior.code_hostile] unless score @s lockdown.channel matches 0 run return 1
execute unless score lockdown.channel lockdown.local matches 0 unless predicate lockdown:local_channel_matches if predicate lockdown:channel_failing_targetable run return 1

# Berserker turrets target friendly mobs unless the channel matches
# The channel check is to ensure berserker turrets/drones don't attack one-another
execute if score lockdown.is_berserker lockdown.local matches 1 if function lockdown:devices/drone/pick_target/targetable_by_berserker_drones run return 1

# Assume not targetable
return 0
