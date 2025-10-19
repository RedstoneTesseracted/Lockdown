# This function handles drone behavior when in the "attacking" state
#
# In this state:
#   * Drone repeatedly fires at target entity
#   * Drone rotates to face entity
#   * Drone tries to strafe around target?
#   * If target goes out of visual firing range, drone enters "pursuing" state
#   * If the drone has a non-zero channel score, and the target's channel score suddenly
#     matches the drone's, it returns to the "investigating" state with no target position
#   * If target is killed, drone enters "investigating" state with no target position

# Update bee data (including rotation)
execute on vehicle run function lockdown:devices/drone/attacking/override_bee_data

# TODO: Drone strafes around target

# Return to investigating state if target found their keycard
execute unless score @s lockdown.channel matches 0 if function lockdown:devices/drone/check/target_has_matching_channel run function lockdown:devices/drone/attacking/approve_and_stand_down

# Enter "patrolling" state if target is lost
execute unless function lockdown:devices/drone/check/target_left_pursuit_range run return run function lockdown:devices/drone/state_change/attacking_to_patrolling

# Fire laser at target
scoreboard players remove @s lockdown.firing_cooldown 1
execute if score @s lockdown.firing_cooldown matches ..0 run function lockdown:devices/drone/fire

# Enter "pursuing" state if target leaves firing range
# TODO: Reduce frequency of this check
# TODO: Add line-of-sight check to this
execute unless function lockdown:devices/drone/check/target_left_firing_range run function lockdown:devices/drone/state_change/attacking_to_pursuing
