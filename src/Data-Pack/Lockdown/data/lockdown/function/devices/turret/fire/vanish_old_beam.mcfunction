# This function vanishes a beam if it is at least 5 ticks old
# It is run BY the laser beam entity and is called from lockdown:devices/turret/fire/scheduled_beam_destroy

# Time guard
execute store result score lockdown.time lockdown.local run time query gametime
scoreboard players operation lockdown.time lockdown.local -= @s lockdown.time
execute unless score lockdown.time lockdown.local matches 5.. run return 0

# Update transformation
data modify entity @s transformation.scale set value [0.0f, 0.0f, 0.0f]
data modify entity @s start_interpolation set value 0

