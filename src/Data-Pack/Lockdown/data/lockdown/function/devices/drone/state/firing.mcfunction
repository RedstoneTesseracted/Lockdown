# This function switches the drone to a "firing" state
# In this state:
#   * Drone stops moving
#   * Drone starts firing its laser
#
# This is run BY and AT the root drone entity

# say set to "firing"

# Update model
data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "hostile"

# Play sound effect
playsound lockdown:entity.drone.identify.target neutral @a ~ ~ ~ 1.0 1.0

# Play sound effects if coming from "standby" state
#execute at @s[tag=lockdown.drone.state.standby] run playsound lockdown:entity.drone.target neutral @a ~ ~ ~ 1.0 1.0

# Update bee data
execute on vehicle run data modify entity @s NoAI set value 0b
execute on vehicle run function lockdown:devices/drone/override_hostile_bee_data
execute on vehicle run attribute @s[type=minecraft:bee] minecraft:flying_speed modifier add lockdown:halt_movement -1.0 add_multiplied_total

# Update state tags
tag @s add lockdown.drone.state.firing
tag @s remove lockdown.drone.state.standby
tag @s remove lockdown.drone.state.approaching
tag @s add lockdown.drone.state.hostile
