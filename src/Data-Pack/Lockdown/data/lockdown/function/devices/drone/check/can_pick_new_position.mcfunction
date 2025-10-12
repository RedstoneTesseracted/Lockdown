# This function checks if the drone is ready to pick a new position
# while in "patrolling" state.  This is run BY the root drone entity
#
# For this to occur, either of the following conditions may be met:
# * Chose a position more than N ticks ago (configured via score lockdown.drone_patrol_timeout lockdown.constant)
# * Reached the last chosen position more than N ticks ago (configured via score lockdown.drone_patrol_delay lockdown.constant)

# Check ticks since last choosing a position
execute store result score lockdown.timestamp lockdown.local run time query gametime
scoreboard players operation lockdown.timestamp lockdown.local -= @s lockdown.drone.choose_timestamp
execute if score lockdown.timestamp lockdown.local > lockdown.drone_patrol_timeout lockdown.constant run return 1

# Check ticks since last reaching a position
execute store result score lockdown.timestamp lockdown.local run time query gametime
scoreboard players operation lockdown.timestamp lockdown.local -= @s lockdown.drone.reach_timestamp
execute if score lockdown.timestamp lockdown.local > lockdown.drone_patrol_delay lockdown.constant run return 1

# No checks passed
return 0
