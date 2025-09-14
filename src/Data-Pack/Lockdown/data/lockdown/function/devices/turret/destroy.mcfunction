# Handles the removal of a turret
# This is run BY and AT the base turret entity

# Drop the item
scoreboard players operation lockdown.channel lockdown.local = @s lockdown.channel
function lockdown:drop/turret

# Team no bees
execute on passengers run data modify entity @s[type=minecraft:bee] DeathTime set value 20s

# Common block removal functionality
function lockdown:devices/common_destroy
