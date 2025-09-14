# This function configures a newly summoned laser beam entity
# This is run BY and AT the new entity

# Safety!
execute unless entity @s[type=minecraft:armor_stand] run return fail

# Set tags
tag @s add lockdown.projectile.mount
tag @s add lockdown.projectile
tag @s add lockdown.laser
tag @s add lockdown.origin.drone

# Set nbt/attribute data
data modify entity @s Invisible set value 1b
data modify entity @s DisabledSlots set value 2147483647
attribute @s minecraft:gravity base set 0.0
# Standard armor stand rider offset: 1.975
# To rescale offset to precisely 0.25 blocks tall: x0.12658227848101264
attribute @s minecraft:scale base set 0.12658227848101264

# Rotate to face target
rotate @s facing entity @e[tag=lockdown.drone.target,limit=1] feet
rotate @s ~ ~-1

# Obtain vector from drone to target - we use this as the motion vector
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^ ^0.5 summon minecraft:marker run function lockdown:devices/drone/fire/store_vector


# Create/mount item display
# 0.25 block offset accounts for sudden shift due to mounting snowball
summon minecraft:item_display ~ ~0.25 ~ {Tags: ["lockdown.projectile", "lockdown.projectile.root", "lockdown.projectile.new", "lockdown.projectile.display", "lockdown.laser"], teleport_duration: 0, interpolation_duration: 1, transformation: {translation: [0.0f, 0.0f, 0.0f], left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f]}, item: {id: "minecraft:paper", components: {"minecraft:item_model": "lockdown:laser_beam","minecraft:custom_data":{lockdown_data:{damage_type:"lockdown:drone_laser"}}}}}
ride @n[tag=lockdown.projectile.new,tag=lockdown.projectile.display] mount @s
execute on passengers run tag @s remove lockdown.projectile.new

# Setting item display Rotation results in an annoying visual artifact for a frame,
# so we use the left/right rotation transforms here instead
data modify storage lockdown:temp transformation.left_rotation set value {angle: 0.0f, axis: [0.0f, -1.0f, 0.0f]}
data modify storage lockdown:temp transformation.right_rotation set value {angle: 0.0f, axis: [1.0f, 0.0f, 0.0f]}
execute store result storage lockdown:temp transformation.left_rotation.angle float 0.00017453292519943295 run data get entity @s Rotation[0] 100.0
execute store result storage lockdown:temp transformation.right_rotation.angle float 0.00017453292519943295 run data get entity @s Rotation[1] 100.0
execute on passengers run data modify entity @s[tag=lockdown.projectile.display] transformation.left_rotation set from storage lockdown:temp transformation.left_rotation
execute on passengers run data modify entity @s[tag=lockdown.projectile.display] transformation.right_rotation set from storage lockdown:temp transformation.right_rotation

# Set scores
# Note: see lockdown:projectile/damage_id_to_string for the conversion between numeric damage types and strings
execute on passengers run scoreboard players set @s[tag=lockdown.projectile.root] lockdown.time 50
execute on passengers run scoreboard players operation @s[tag=lockdown.projectile.root] lockdown.firing_damage = lockdown.damage lockdown.local
execute on passengers run scoreboard players set @s[tag=lockdown.projectile.root] lockdown.left_origin 0

# Save origin UUID to avoid colliding with origin
execute on passengers if entity @s[tag=lockdown.projectile.root] run scoreboard players operation @s lockdown.origin_uuid1 = lockdown.uuid1 lockdown.local
execute on passengers if entity @s[tag=lockdown.projectile.root] run scoreboard players operation @s lockdown.origin_uuid2 = lockdown.uuid2 lockdown.local
execute on passengers if entity @s[tag=lockdown.projectile.root] run scoreboard players operation @s lockdown.origin_uuid3 = lockdown.uuid3 lockdown.local
execute on passengers if entity @s[tag=lockdown.projectile.root] run scoreboard players operation @s lockdown.origin_uuid4 = lockdown.uuid4 lockdown.local

# Save motion data for use in subsequent ticks
execute store result score @s lockdown.motion.x run data get storage lockdown:temp pos.x 10000.0
execute store result score @s lockdown.motion.y run data get storage lockdown:temp pos.y 10000.0
execute store result score @s lockdown.motion.z run data get storage lockdown:temp pos.z 10000.0

# Set motion tag
data modify entity @s Motion[0] set from storage lockdown:temp pos.x
data modify entity @s Motion[1] set from storage lockdown:temp pos.y
data modify entity @s Motion[2] set from storage lockdown:temp pos.z
