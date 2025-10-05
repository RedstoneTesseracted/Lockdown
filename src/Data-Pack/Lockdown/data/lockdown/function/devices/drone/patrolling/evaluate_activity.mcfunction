# This function evaluates whether an entity is producing investigation-worthy activity.
# This is run BY the entity to evaluate, AT the drone's position
#
# An entity is eligible for investigation if both of the following are true:
# * Is within field-of-view OR is moving quickly
# * Hasn't recently been investigated

# Ignore if recently investigated
execute if function lockdown:devices/drone/check/is_approved run return 0

# Definitely investigate if within field of view
execute if function lockdown:devices/drone/check/within_fov run return run function lockdown:devices/drone/patrolling/flag_anomaly

# Fast movement can alert drone
execute if predicate lockdown:movement_alerts_drone run return run function lockdown:devices/drone/patrolling/flag_anomaly

# Nothing to see here
return 0
