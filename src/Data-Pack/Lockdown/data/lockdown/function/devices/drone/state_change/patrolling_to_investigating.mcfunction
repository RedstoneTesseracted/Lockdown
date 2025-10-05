# This function switches the drone from a "patrolling" to an "investigating" state
# This is run BY and AT the root drone entity

# Clear any patrol markers, if they exist
execute on vehicle on target run kill @s[tag=lockdown.drone.patrol_marker]

# Update model
data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "alert"

# Play effects
playsound lockdown:entity.drone.notice neutral @a ~ ~ ~ 1.0 1.0

# Update state tags
tag @s remove lockdown.drone.state.patrolling
tag @s add lockdown.drone.state.investigating
tag @s add lockdown.drone.skip_state_function

