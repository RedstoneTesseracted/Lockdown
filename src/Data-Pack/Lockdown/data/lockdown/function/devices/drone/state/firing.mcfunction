# This function switches the drone to a "firing" state
# In this state:
#   * Drone stops moving
#   * Drone starts firing its laser
#
# This is run BY the root drone entity

# say set to "firing"

# Update model
data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "hostile"

# Play sound effect
playsound lockdown:entity.drone.identify.target neutral @a ~ ~ ~ 1.0 1.0

# Update bee data
# Here we push the bee up slightly to stop it from flying too low
execute on vehicle run data modify entity @s NoAI set value 0b
execute on vehicle run function lockdown:devices/drone/override_hostile_bee_data
execute on vehicle run attribute @s[type=minecraft:bee] minecraft:flying_speed modifier add lockdown:halt_movement -1.0 add_multiplied_total

# Nudge the bee upwards if it's too close vertically
execute at @s if predicate lockdown:vehicle_near_target_vertically on vehicle run data modify entity @s Motion[1] set value 0.075d

# Update state tags
tag @s add lockdown.drone.state.firing
tag @s remove lockdown.drone.state.standby
tag @s remove lockdown.drone.state.approaching
tag @s add lockdown.drone.state.hostile
