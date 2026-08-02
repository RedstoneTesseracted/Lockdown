# This function determines whether a suspect entity is considered an "enemy".
# This is run BY the suspect
#
# Conditions for being an enemy:
#   * A suspect cannot be considered an enemy if it has recently been approved
#   * A suspect is considered an enemy if it's a hostile mob
#   * A suspect cannot be targeted if it is not visible (either outside FOV or potion effect)
#   * If the drone has a non-zero channel, it also considers targetables (players + entities
#     with the lockdown.behavior.code_hostile tag) with a non-matching channel to be enemies
#   * When in berserker mode, drones will attack players regardless of channel.  Additionally,
#     they will cease targeting non-hostile mobs and start targeting friendly mobs.

# Ignore creative/spectator mode players
execute if predicate lockdown:creative_or_spectator run return 0

# Check if entity has already been investigated
execute if function lockdown:devices/drone/approval/contains run return 0

# Should be visible
execute unless function lockdown:devices/drone/check/within_fov run return 0
execute if predicate lockdown:is_invisible run return 0

# Hostile mobs are generally applicable (except in berserker mode)
execute unless score lockdown.is_berserker_drone lockdown.local matches 1 if entity @s[type=#lockdown:hostile] run return run function lockdown:devices/drone/pick_target/flag_enemy

# Players are always targetable by berserker drones
execute if score lockdown.is_berserker_drone lockdown.local matches 1 if entity @s[type=minecraft:player] run return run function lockdown:devices/drone/pick_target/flag_enemy

# Deny targetable entities with non-matching channel (if applicable)
execute if score lockdown.channel lockdown.local matches 0 if entity @s[tag=lockdown.behavior.code_hostile] unless score @s lockdown.channel matches 0 run return run function lockdown:devices/drone/pick_target/flag_enemy
execute unless score lockdown.channel lockdown.local matches 0 unless predicate lockdown:local_channel_matches if predicate lockdown:channel_failing_targetable run return run function lockdown:devices/drone/pick_target/flag_enemy

# Berserker drones target friendly mobs unless the channel matches
# The channel check is to ensure berserker drones don't attack one-another
execute if score lockdown.is_berserker_drone lockdown.local matches 1 if function lockdown:devices/drone/pick_target/targetable_by_berserker_drones run return run function lockdown:devices/drone/pick_target/flag_enemy

# All checks passed: suspect is approved
return run function lockdown:devices/drone/approval/add
