# This function switches the drone from the "attacking" state to the "pursuing" state

say attacking -> pursuing

# Ok bee, you'll need to move again
function lockdown:devices/drone/unfreeze_bee

# Update state tags
tag @s remove lockdown.drone.state.attacking
tag @s add lockdown.drone.state.pursuing
tag @s add lockdown.drone.skip_state_function
