# This function is called whenever the player uses a spray can

# Shift-right-clicking cycles between color
execute if predicate lockdown:sneaking run return run function lockdown:items/spray_paint/cycle_color

# Right-clicking on a drone/turret in main hand applies the primary color
# Right-clicking on a drone/turret in off hand applies the secondary color

playsound lockdown:spray_can.spray player @a ~ ~ ~ 1 1
