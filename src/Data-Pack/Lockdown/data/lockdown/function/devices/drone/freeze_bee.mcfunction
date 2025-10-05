# Used to force the bee to remain motionless
# This is run BY the bee hitbox entity

# Remain motionless
data modify entity @s Motion set value [0.0d, 0.0d, 0.0d]
attribute @s[type=minecraft:bee] minecraft:flying_speed modifier add lockdown:halt_movement -1.0 add_multiplied_total
tag @s add lockdown.drone.motionless
