# This function evaluates whether an entity is producing investigation-worthy activity.
# This is run BY the entity to evaluate, AT the drone's position
#
# An entity is eligible for investigation if both of the following are true:
# * Is within field-of-view OR is moving quickly OR is very close
# * Hasn't recently been investigated

# Ignore if recently investigated
execute if function lockdown:devices/drone/approval/contains run return 0

# Fast movement can alert drone
execute if predicate lockdown:movement_alerts_drone run return run function lockdown:devices/drone/patrolling/flag_anomaly

# The proximity and FOV checks below should NOT be tripped if the entity is invisible
execute if predicate lockdown:is_invisible run return 0

# He's right behind me, isn't he?
execute if entity @s[distance=..4] run return run function lockdown:devices/drone/patrolling/flag_anomaly

# Definitely investigate if within field of view
execute if function lockdown:devices/drone/check/within_fov run return run function lockdown:devices/drone/patrolling/flag_anomaly

# Nothing to see here
return 0
