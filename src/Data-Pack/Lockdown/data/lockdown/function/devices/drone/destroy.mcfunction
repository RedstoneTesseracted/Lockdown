# Handles the removal of a drone
# This is run BY and AT the base drone entity

# Team no bees
execute on vehicle run data modify entity @s[type=minecraft:bee] DeathTime set value 20s

# Spawn the dropped item
scoreboard players operation lockdown.channel lockdown.local = @s lockdown.channel
function lockdown:drop/drone

# Common block removal functionality
function lockdown:devices/common_destroy
