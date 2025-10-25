# This function handles drone behavior when in the "patrolling" state
#
# In this state:
#   * Drone periodically picks random position within range of home position
#   * Drone navigates towards chosen position
#   * Drone enters "investigating" state if it detects anomalous activity
#     (see evaluate_activity) within pursuit range
#   * Done enters either "pursuing" or "attacking" state if attacked

# Update bee data
execute if entity @s[tag=lockdown.drone.has_target] on vehicle run function lockdown:devices/drone/override_hostile_bee_data
execute unless entity @s[tag=lockdown.drone.has_target] on vehicle run function lockdown:devices/drone/override_nonhostile_bee_data

# Update patrolling behavior
execute if function lockdown:devices/drone/check/can_pick_new_position if function lockdown:devices/drone/patrolling/choose_patrol_position run function lockdown:devices/drone/patrolling/create_patrol_point with storage lockdown:temp candidate_pos
execute if predicate lockdown:near_target if function lockdown:devices/drone/check/target_exists run function lockdown:devices/drone/patrolling/reach_patrol_position

# Periodically check for suspicious activity
execute if function lockdown:devices/drone/check/periodic_activity_check if function lockdown:devices/drone/patrolling/detect_suspicious run return run function lockdown:devices/drone/state_change/patrolling_to_investigating

# Immediately get angry if attacked
execute if function lockdown:devices/drone/check/has_attacker run function lockdown:devices/drone/state_change/when_attacked
