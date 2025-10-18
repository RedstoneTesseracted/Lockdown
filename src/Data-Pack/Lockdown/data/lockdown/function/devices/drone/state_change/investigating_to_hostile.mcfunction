# This function switches the drone from a "investigating" state to either
# the "pursuing" or "attacking" states—depending on whether the target
# is close enough.
# This is run BY and AT the root drone entity

say investigating -> hostile

# Clear any patrol markers, if they exist
execute on vehicle on target run kill @s[tag=lockdown.drone.patrol_marker]

# Update model
data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "hostile"

# Play effects
playsound lockdown:entity.drone.identify.target neutral @a ~ ~ ~ 1.0 1.0

# Decide whether to enter "pursuing" or "attacking" state
scoreboard players set lockdown.result lockdown.local 0
execute if function lockdown:devices/drone/check/target_within_firing_range run scoreboard players set lockdown.result lockdown.local 1
execute if score lockdown.result lockdown.local matches 0 run tag @s add lockdown.drone.state.pursuing
execute if score lockdown.result lockdown.local matches 1 run tag @s add lockdown.drone.state.attacking

# Update state tags
tag @s remove lockdown.drone.reached_anomaly
tag @s add lockdown.drone.has_target
tag @s remove lockdown.drone.state.investigating
tag @s add lockdown.drone.skip_state_function


