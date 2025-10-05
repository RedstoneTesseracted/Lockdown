# This function switches the drone to its standby state
# It is run BY the root drone entity

# say set to "standby"

# Update model
data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "standby"

# Update bee data
execute on vehicle run data modify entity @s NoAI set value 1b
execute on vehicle run data remove entity @s AngryAt
execute on vehicle run attribute @s minecraft:flying_speed modifier remove lockdown:halt_movement

# Update state tags
tag @s remove lockdown.drone.state.firing
tag @s add lockdown.drone.state.standby
tag @s add lockdown.drone.state.approaching
tag @s remove lockdown.drone.state.hostile
