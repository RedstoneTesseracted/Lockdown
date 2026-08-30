# This function is used by lockdown:devices/laser_cannon/mount/gantry_callback and lockdown:devices/laser_cannon/mount/barrel_callback
# to determine which interaction entity the player interacted with

# Already found... stop
execute if score lockdown.found_interaction lockdown.local matches 1 run return 0

# Did interact?
execute unless function lockdown:devices/laser_cannon/mount/did_interact run return 0

# Set state tags/score
scoreboard players set lockdown.found_interaction lockdown.local 1
execute on vehicle if entity @s[tag=lockdown.block.root] run return run tag @s add lockdown.context
execute on vehicle on vehicle if entity @s[tag=lockdown.block.root] run return run tag @s add lockdown.context
execute on vehicle on vehicle on vehicle if entity @s[tag=lockdown.block.root] run return run tag @s add lockdown.context
