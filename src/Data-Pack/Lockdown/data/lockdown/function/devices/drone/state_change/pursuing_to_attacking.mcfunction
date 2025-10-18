# This function switches the drone from the "pursuing" state to the "attacking" state

say pursuing -> attacking

# Stop trusting the bee's AI at this distance
function lockdown:devices/drone/freeze_bee

# Update state tags
tag @s remove lockdown.drone.state.pursuing
tag @s add lockdown.drone.state.attacking
tag @s add lockdown.drone.skip_state_function
