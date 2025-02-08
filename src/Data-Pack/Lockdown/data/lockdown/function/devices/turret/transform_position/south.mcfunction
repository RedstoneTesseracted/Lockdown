# Acquire's target position in the south-facing turret's coordinate system.
# These will be used elsewhere to calculate the angles needed to point the
# turret at its target

# Storage is used to build the display rotation data
# This simply happened to be a convenient place to put it, despite the ugliness
data modify storage lockdown:temp rotation.transformation.left_rotation.axis set value [ 0.0f,  0.0f, -1.0f]
data modify storage lockdown:temp rotation.transformation.right_rotation.axis set value [ 1.0f,  0.0f, 0.0f]

# YOOO—WE'RE ACTUALLY USING THE SWAP OPERATOR LET'S GO!!!!
scoreboard players operation lockdown.y lockdown.local >< lockdown.z lockdown.local
scoreboard players operation lockdown.z lockdown.local *= -1 lockdown.number
