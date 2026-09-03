# This function causes the player's camera distance to increase while they are riding a laser cannon

attribute @s minecraft:camera_distance modifier add lockdown:laser_cannon_zoom_out 4.0 add_value
tag @s add lockdown.laser_cannon.zoom_out

# Activate the per-tick function meant to clear zoom-out once player unmounts
schedule function lockdown:devices/laser_cannon/riding_tick 1t append
