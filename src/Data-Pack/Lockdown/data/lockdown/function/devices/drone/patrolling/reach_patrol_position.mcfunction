# This function is called whenever the bee reaches its patrol position

# Kill the patrol marker entity
execute on vehicle on target run kill @s[tag=lockdown.drone.patrol_marker]

# Update state tags/scores
execute store result score @s lockdown.drone.reach_timestamp run time query gametime
tag @s remove lockdown.drone.has_target
