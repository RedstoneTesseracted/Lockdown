# This function switches the drone from an "attacking" to an "investigating" state
# This is run BY and AT the root drone entity

#say attacking -> investigating

# Update model
data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "alert"

# Play effects
playsound lockdown:entity.drone.confirm neutral @a ~ ~ ~ 1.0 1.0

# Update scores
execute store result score @s lockdown.drone.choose_timestamp run time query gametime
execute store result score @s lockdown.drone.reach_timestamp run time query gametime

# Update state tags
tag @s remove lockdown.drone.has_target
tag @s add lockdown.drone.state.investigating
tag @s remove lockdown.drone.state.attacking
tag @s add lockdown.drone.skip_state_function
