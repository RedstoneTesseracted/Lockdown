# This function switches the drone from a "patrolling" to an "investigating" state
# This is run BY and AT the root drone entity

say patrolling -> investigating

# Clear any patrol markers, if they exist
execute on vehicle on target run kill @s[tag=lockdown.drone.patrol_marker]

# Mark new target position using vector stored in data.suspect_pos (format: {x: 0, y: 0, z: 0})
function lockdown:devices/drone/patrolling/create_patrol_point with entity @s data.suspect_pos

# Update model
data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "alert"

# Play effects
playsound lockdown:entity.drone.notice neutral @a ~ ~ ~ 1.0 1.0

# Update scores
execute store result score @s lockdown.drone.choose_timestamp run time query gametime
scoreboard players set @s lockdown.drone.reach_timestamp 2147483647

# Update state tags
tag @s add lockdown.drone.has_target
tag @s remove lockdown.drone.reached_anomaly
tag @s remove lockdown.drone.state.patrolling
tag @s add lockdown.drone.state.investigating
tag @s add lockdown.drone.skip_state_function

