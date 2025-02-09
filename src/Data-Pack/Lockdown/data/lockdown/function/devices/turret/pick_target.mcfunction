# This function picks a new target for the turret.  The chosen target's UUID is stored in the turret's scoreboard.
# Run BY and AT the turret base entity
#
# The rules for selecting targets are as follows:
# 1. Candidates must be within firing range
# 2. If this turret has an assigned code:
#      Candidates include:
#      1. Hostile mobs
#      2. Players with non-matching code
#      3. Drones with non-matching code
#      4. Turrets with non-matching code
#    Otherwise:
#      Candidates include:
#      1. Hostile mobs
# 3. Clear line of sight between turret and candidate
# 4. Nearest candidate is selected

# Select all entities within range
execute store result storage lockdown:temp args.range int 1 run scoreboard players get @s lockdown.firing_range
function lockdown:devices/turret/pick_target/within_range with storage lockdown:temp args
data remove storage lockdown:temp args.range


# Eliminate entities where we don't have a clear line of sight
function lockdown:devices/turret/pick_target/line_of_sight


# Choose nearest candidate
tag @s remove lockdown.turret.has_target
execute if entity @e[tag=lockdown.turret.candidate] run tag @s add lockdown.turret.has_target
execute as @n[tag=lockdown.turret.candidate] run function lockdown:devices/turret/pick_target/store_target_uuid
scoreboard players operation @s lockdown.target_uuid1 = lockdown.target_uuid1 lockdown.local
scoreboard players operation @s lockdown.target_uuid2 = lockdown.target_uuid2 lockdown.local
scoreboard players operation @s lockdown.target_uuid3 = lockdown.target_uuid3 lockdown.local
scoreboard players operation @s lockdown.target_uuid4 = lockdown.target_uuid4 lockdown.local

# Clear candidates list
tag @e remove lockdown.turret.candidate
