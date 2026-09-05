# This function is called whenever the player uses a spray can.
# Normally, this is called by lockdown:items/upgrade/use (the spray can is treated as a re-useable upgrade).
# However, in the case of laser cannons, this can be called by lockdown:devices/laser_cannon/mount/ride_callback.
# The latter technically skips setting the lockdown.player_context tag that gets set in lockdown:items/upgrade/use,
# however the spray can doesn't make use of that, so it should be fine.

# Shift-right-clicking cycles between color
execute if predicate lockdown:sneaking run return run function lockdown:items/spray_paint/cycle_color

# Right-clicking on a drone/turret in main hand applies the primary color
# Right-clicking on a drone/turret in off hand applies the secondary color

playsound lockdown:spray_can.spray player @a ~ ~ ~ 1 1


# Figure out what entity the player targeted with the upgrade and tag them with lockdown.context
# If no such entity exists, abort immediately
execute unless function lockdown:items/upgrade/find_target run return 0

# Apply color to valid device
function lockdown:items/spray_paint/get_action
execute as @e[tag=lockdown.context,limit=1] at @s run function lockdown:items/spray_paint/apply

# Clear context tags
tag @e[tag=lockdown.context] remove lockdown.context
