# Called by several root state functions to override the hitbox bee's NBT data and keep it "beehaving"

# Target no-one
data remove entity @s AngryAt
data modify entity @s AngerTime set value 0
data modify entity @s HasStung set value 0b

# Freeze if needed
execute if entity @s[tag=!lockdown.drone.motionless] run function lockdown:devices/drone/freeze_bee
