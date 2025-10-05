# This function begins the drone's "approaching" state
# In this state:
#   * Drone if free to move
#
# It is run BY the root drone entity

# say set to "approaching"

# Update model
data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "alert"

# Play effects
playsound lockdown:entity.drone.notice neutral @a ~ ~ ~ 1.0 1.0

# Update bee data
execute on vehicle run data modify entity @s NoAI set value 0b
execute on vehicle run function lockdown:devices/drone/override_hostile_bee_data
execute on vehicle run attribute @s minecraft:flying_speed modifier remove lockdown:halt_movement

# Update tags
tag @s remove lockdown.drone.state.firing
tag @s remove lockdown.drone.state.standby
tag @s add lockdown.drone.state.approaching
tag @s add lockdown.drone.state.hostile
