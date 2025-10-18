# This function handles drone behavior when in the "pursuing" state
#
# In this state:
#   * Drone stops firing at target entity
#   * Drone navigates towards target entity
#   * If target enters visual firing range, drone enters "attacking" state
#   * If target is lost (dies or leaves pursuit range), drone enters "patrolling" state

# Update bee data
execute on vehicle run function lockdown:devices/drone/override_hostile_bee_data

# Enter "attacking" state if target is within firing range
execute if function lockdown:devices/drone/check/target_within_firing_range run function lockdown:devices/drone/state_change/pursuing_to_attacking

# Enter "patrolling" state if target is lost
execute unless function lockdown:devices/drone/check/target_within_pursuit_range run function lockdown:devices/drone/state_change/pursuing_to_patrolling
