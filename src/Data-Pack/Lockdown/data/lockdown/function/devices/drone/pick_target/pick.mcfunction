# This function handles picking a new target for the drone
#
# There are two execution cases:
#   Run BY and AT the drone base entity
#   Run BY the drone base entity, AT a control tower (only applies when drone has control tower upgrade)
#
# The rules for selecting targets are as follows:
# 1. Candidates must be within range of execution position
# 2. If this drone has an assigned code (always true):
#      Candidates include:
#      1. Hostile mobs
#      2. Players with non-matching code
#      3. Drones with non-matching code
#      4. Turrets with non-matching code
#    Otherwise:
#      Candidates include:
#      1. Hostile mobs
# 3. Nearest candidate to drone is selected
#

# Select all entities within range
execute store result storage lockdown:temp args.range int 1 run scoreboard players get @s lockdown.firing_range
function lockdown:devices/drone/pick_target/within_range with storage lockdown:temp args
data remove storage lockdown:temp args.range

# Choose nearest candidate
tag @s remove lockdown.drone.has_target
execute if entity @e[tag=lockdown.drone.candidate] run tag @s add lockdown.drone.has_target
execute on vehicle run function lockdown:devices/drone/pick_target/store_target_uuid

# Update state
execute if entity @s[tag=!lockdown.drone.state.hostile,tag=lockdown.drone.has_target] run function lockdown:devices/drone/state/choose_hostile
execute if entity @s[tag=lockdown.drone.state.hostile,tag=!lockdown.drone.has_target] run function lockdown:devices/drone/state/standby

# Clear candidates list
tag @e remove lockdown.drone.candidate

return run execute if entity @s[tag=lockdown.drone.has_target]
