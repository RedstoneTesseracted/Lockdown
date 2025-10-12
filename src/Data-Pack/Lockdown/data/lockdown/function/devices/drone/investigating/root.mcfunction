# This function handles drone behavior when in the "investigating" state
#
# In this state:
#   * Drone navigates towards location of interest
#   * Remains in "investigating" state for at least 10 ticks
#   * The drone checks all suspects within visual pursuit range on its way to the target location
#   * Drone shows a scanning animation ~~and faces towards the nearest suspect~~
#   * Drone enters either "pursuing" or "attacking" state if a suspect is found to be an "enemy"
#   * Drone enters "patrolling" state if no enemy is found near the location of interest

# Update investigating behavior
execute if function lockdown:devices/drone/check/has_investigated_long_enough run return run function lockdown:devices/drone/state_change/investigating_to_patrolling
execute if predicate lockdown:near_target if function lockdown:devices/drone/check/target_exists run function lockdown:devices/drone/investigating/reach_anomaly_position

# Update bee data
execute if entity @s[tag=lockdown.drone.has_target] on vehicle run function lockdown:devices/drone/override_hostile_bee_data
execute unless entity @s[tag=lockdown.drone.has_target] on vehicle run function lockdown:devices/drone/override_nonhostile_bee_data

# Periodically check for enemies
execute if function lockdown:devices/drone/check/periodic_activity_check if function lockdown:devices/drone/pick_target/pick_enemy run return run function lockdown:devices/drone/state_change/investigating_to_hostile

# Immediately get angry if attacked
execute if function lockdown:devices/drone/check/has_attacker run function lockdown:devices/drone/state_change/when_attacked

