# This function handles drone behavior when in the "patrolling" state
#
# In this state:
#   * Drone navigates towards location of interest
#   * Remains in "investigating" state for at least 10 ticks
#   * The drone checks all suspects within visual pursuit range on its way to the target location
#   * Drone shows a scanning animation and faces towards the nearest suspect
#   * Drone enters either "pursuing" or "attacking" state if a suspect is found to be an "enemy"
#   * Drone enters "patrolling" state if no enemy is found near the location of interest

