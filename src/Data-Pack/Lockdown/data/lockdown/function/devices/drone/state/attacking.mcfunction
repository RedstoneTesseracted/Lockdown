# This function handles drone behavior when in the "patrolling" state
#
# In this state:
#   * Drone repeatedly fires at target entity
#   * Drone rotates to face entity
#   * Drone tries to strafe around target?
#   * If target goes out of visual firing range, drone enters "pursuing" state
#   * Drone pursues target if it goes out of firing range
#   * If the drone has a non-zero channel score, and the target's channel score suddenly
#     matches the drone's, it returns to the "investigating" state with no target position
#   * If target is killed, drone enters "investigating" state with no target position

