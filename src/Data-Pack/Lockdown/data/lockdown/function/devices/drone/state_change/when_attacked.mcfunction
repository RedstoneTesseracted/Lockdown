# This function is used to initiate a state change whenever the drone is directly attacked
# It could be run from either the "patrolling" or "investigating" state

# Clear any patrol markers, if they exist
execute on vehicle on target run kill @s[tag=lockdown.drone.patrol_marker]

# Update state tags
tag @s remove lockdown.drone.reached_anomaly
tag @s remove lockdown.drone.state.patrolling
tag @s remove lockdown.drone.state.investigating
tag @s add lockdown.drone.skip_state_function
