# Called by several root state functions to override the hitbox bee's NBT data and keep it "beehaving"

# Force stung status
data modify entity @s HasStung set value 0b
data modify entity @s AngerTime set value 1000

# Force target UUID
data modify entity @s AngryAt set from entity @s data.angry_at

# Unfreeze if needed
execute if entity @s[tag=lockdown.drone.motionless] run function lockdown:devices/drone/unfreeze_bee
