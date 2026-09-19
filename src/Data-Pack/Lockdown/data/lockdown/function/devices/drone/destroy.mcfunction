# Handles the removal of a drone
# This is run BY and AT the base drone entity

# Destroy any patrol markers
execute on vehicle on target run kill @s[tag=lockdown.drone.patrol_marker]

# Team no bees
execute on vehicle run data modify entity @s[type=minecraft:bee] DeathTime set value 20s

# Spawn the dropped item
scoreboard players operation lockdown.channel lockdown.local = @s lockdown.channel
execute unless entity @s[tag=lockdown.behavior.fragile] run function lockdown:drop/drone
execute if entity @s[tag=lockdown.behavior.fragile] run function lockdown:drop/drone_fragile

# Common block removal functionality
function lockdown:devices/common_destroy
