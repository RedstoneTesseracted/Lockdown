# This function switches the drone from a "investigating" to a "patrolling" state
# This is run BY and AT the root drone entity

say investigating -> patrolling

# Clear any patrol markers, if they exist
execute on vehicle on target run kill @s[tag=lockdown.drone.patrol_marker]

# Update model
data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "standby"

# Play effects
#playsound lockdown:entity.drone.notice neutral @a ~ ~ ~ 1.0 1.0

# Update scores
execute store result score @s lockdown.drone.choose_timestamp run time query gametime
scoreboard players operation @s lockdown.drone.choose_timestamp -= lockdown.drone_patrol_timeout lockdown.constant

# Update state tags
tag @s remove lockdown.drone.has_target
tag @s remove lockdown.drone.reached_anomaly
tag @s add lockdown.drone.state.patrolling
tag @s remove lockdown.drone.state.investigating
tag @s add lockdown.drone.skip_state_function

