# Used to end the effects of lockdown:devices/drone/freeze_bee
# This is run BY the bee hitbox entity

attribute @s minecraft:flying_speed modifier remove lockdown:halt_movement
tag @s remove lockdown.drone.motionless
