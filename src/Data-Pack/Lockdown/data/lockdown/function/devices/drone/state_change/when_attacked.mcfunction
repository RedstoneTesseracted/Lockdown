# This function is used to initiate a state change whenever the drone is directly attacked
# It could be run from either the "patrolling" or "investigating" state, and may place the
# drone in either the "pursuing" or "attacking" states, depending on proximity.
#
# The state change will be canceled of the attacker is not a valid target

say retaliating

# Check if the attacker is a valid target and only proceed if they are
scoreboard players set lockdown.is_enemy lockdown.local 0
data modify storage lockdown:temp approved set from entity @s data.approved
execute on attacker if function lockdown:devices/drone/pick_target/evaluate_suspect run scoreboard players set lockdown.is_enemy lockdown.local 1
data modify entity @s data.approved set from storage lockdown:temp approved
execute if score lockdown.is_enemy lockdown.local matches 0 run return 0

say confirmed: retaliating

# Clear any patrol markers, if they exist
execute on vehicle on target run kill @s[tag=lockdown.drone.patrol_marker]

# Update model
data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "hostile"

# Play effects
playsound lockdown:entity.drone.identify.target neutral @a ~ ~ ~ 1.0 1.0

# Decide whether to enter "pursuing" or "attacking" state
scoreboard players set lockdown.result lockdown.local 0
execute if function lockdown:devices/drone/check/target_entered_firing_range run scoreboard players set lockdown.result lockdown.local 1
execute if score lockdown.result lockdown.local matches 0 run tag @s add lockdown.drone.state.pursuing
execute if score lockdown.result lockdown.local matches 1 run tag @s add lockdown.drone.state.attacking

# Update state tags
tag @s remove lockdown.drone.reached_anomaly
tag @s remove lockdown.drone.state.patrolling
tag @s remove lockdown.drone.state.investigating
tag @s add lockdown.drone.skip_state_function
