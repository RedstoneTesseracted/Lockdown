# This function switches the drone from a "pursuing" to a "patrolling" state
# This is run BY and AT the root drone entity

say pursuing -> patrolling

# Update model
data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "standby"

# Play effects
#playsound lockdown:entity.drone.notice neutral @a ~ ~ ~ 1.0 1.0

# Update scores
execute store result score @s lockdown.drone.choose_timestamp run time query gametime
scoreboard players operation @s lockdown.drone.choose_timestamp -= lockdown.drone_patrol_timeout lockdown.constant

# Update state tags
tag @s remove lockdown.drone.has_target
tag @s add lockdown.drone.state.patrolling
tag @s remove lockdown.drone.state.pursuing
tag @s add lockdown.drone.skip_state_function
