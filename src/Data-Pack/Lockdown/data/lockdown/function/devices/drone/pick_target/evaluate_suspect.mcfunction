# This function determines whether a suspect entity is considered an "enemy".
# This is run BY the suspect
#
# Conditions for being an enemy:
#   * A suspect cannot be considered an enemy if it has recently been approved
#   * A suspect is considered an enemy if it's a hostile mob
#   * A suspect cannot be targeted if it is not visible (either outside FOV or potion effect)
#   * If the drone has a non-zero channel, it also considers targetables (players + entities
#     with the lockdown.behavior.code_hostile tag) with a non-matching channel to be enemies

# Check if entity has already been investigated
execute if function lockdown:devices/drone/approval/contains run return 0

# Should be visible
execute unless function lockdown:devices/drone/check/within_fov run return 0
execute if predicate lockdown:is_invisible run return 0

# Hostile mobs are generally applicable
execute if entity @s[type=#lockdown:hostile] run return run function lockdown:devices/drone/pick_target/flag_enemy

# Deny targetable entities with non-matching channel (if applicable)
execute unless score lockdown.channel lockdown.local matches 0 unless score lockdown.channel lockdown.local = @s lockdown.channel if predicate lockdown:channel_failing_targetable run function lockdown:devices/drone/pick_target/flag_enemy

# All checks passed: suspect is approved
return run function lockdown:devices/drone/approval/add
