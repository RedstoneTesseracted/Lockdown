# This function configures a fireball spawned by the turret
# This is run BY and AT the fireball, and is invoked using `execute summon minecraft:small_fireball`

# Obtain vector from drone to target - we use this as the motion vector
# The fireball speed can be adjusted by changing the 1.0 below
function lockdown:devices/drone/fire/__summon_laser with storage lockdown:temp target_pos
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^ ^0.75 summon minecraft:marker run function lockdown:devices/drone/fire/store_vector

# Set NBT data
data modify entity @s Motion[0] set from storage lockdown:temp pos.x
data modify entity @s Motion[1] set from storage lockdown:temp pos.y
data modify entity @s Motion[2] set from storage lockdown:temp pos.z
data modify entity @s Owner set from storage lockdown:temp origin
