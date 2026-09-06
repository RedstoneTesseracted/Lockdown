# This function handles rotating the cannon to point in the direction the player is looking
# This is run BY and AT the root cannon entity
#
# Assumption: an entity is currently riding on the seat entity, which is riding the root entity

# Get the player's current rotation
execute on passengers if entity @s[tag=lockdown.laser_cannon.seat] on passengers run function lockdown:devices/laser_cannon/rotate/get_rotation

# Get current y-axis rotation of gantry
#execute on passengers if entity @s[tag=lockdown.laser_cannon.gantry] store result score lockdown.laser_cannon.azimuth lockdown.local run data get entity @s Rotation[0] 100.0

# Move azimuth toward rider look direction at a capped rate.
# TODO: Ease in/out
# This also compensates for the -180°/+180° crossover
scoreboard players operation lockdown.laser_cannon.azimuth lockdown.local = @s lockdown.azimuth
scoreboard players operation lockdown.delta lockdown.local = lockdown.azimuth lockdown.local
scoreboard players operation lockdown.delta lockdown.local -= @s lockdown.azimuth
execute if score lockdown.delta lockdown.local matches 18000.. run scoreboard players remove lockdown.delta lockdown.local 36000
execute if score lockdown.delta lockdown.local matches ..-18000 run scoreboard players add lockdown.delta lockdown.local 36000
scoreboard players operation lockdown.delta lockdown.local > lockdown.cannon_rotate_azimuth_min lockdown.constant
scoreboard players operation lockdown.delta lockdown.local < lockdown.cannon_rotate_azimuth_max lockdown.constant
scoreboard players operation lockdown.laser_cannon.azimuth lockdown.local += lockdown.delta lockdown.local

# Update y-axis rotation of gantry, barrel, and beam (if it exists)
scoreboard players operation @s lockdown.azimuth = lockdown.laser_cannon.azimuth lockdown.local
execute on passengers if entity @s[tag=lockdown.laser_cannon.gantry] store result entity @s Rotation[0] float 0.01 run scoreboard players get lockdown.laser_cannon.azimuth lockdown.local
execute on passengers if entity @s[tag=lockdown.laser_cannon.barrel] store result entity @s Rotation[0] float 0.01 run scoreboard players get lockdown.laser_cannon.azimuth lockdown.local
execute on passengers if entity @s[tag=lockdown.laser_cannon.beam] store result entity @s Rotation[0] float 0.01 run scoreboard players get lockdown.laser_cannon.azimuth lockdown.local

#data modify storage lockdown:temp rotation set value {axis: [0.0, 1.0, 0.0], angle: 0.0}
#execute store result storage lockdown:temp rotation.angle float -0.00017453292519943296 run scoreboard players get @s lockdown.azimuth
#execute on passengers if entity @s[tag=lockdown.laser_cannon.gantry] run data modify entity @s transformation.right_rotation set from storage lockdown:temp rotation
#execute on passengers if entity @s[tag=lockdown.laser_cannon.barrel] run data modify entity @s transformation.left_rotation set from storage lockdown:temp rotation

#title @a actionbar [{score: {name: "lockdown.laser_cannon.azimuth", objective: "lockdown.local"}}, ", ", {nbt: "Rotation[0]", entity: "@n[tag=lockdown.laser_cannon.barrel]"}]

# Move pitch similarly to azimuth
scoreboard players operation lockdown.delta lockdown.local = lockdown.pitch lockdown.local
scoreboard players operation lockdown.delta lockdown.local -= @s lockdown.pitch
scoreboard players operation lockdown.delta lockdown.local > lockdown.cannon_rotate_pitch_min lockdown.constant
scoreboard players operation lockdown.delta lockdown.local < lockdown.cannon_rotate_pitch_max lockdown.constant
scoreboard players operation @s lockdown.pitch += lockdown.delta lockdown.local
scoreboard players operation @s lockdown.pitch > lockdown.cannon_pitch_min lockdown.constant
scoreboard players operation @s lockdown.pitch < lockdown.cannon_pitch_max lockdown.constant

# Update x-axis rotation of barrel and beam (if it exists)
data modify storage lockdown:temp rotation set value {axis: [1.0, 0.0, 0.0], angle: 0.0}
execute store result storage lockdown:temp rotation.angle float 0.00017453292519943296 run scoreboard players get @s lockdown.pitch
execute on passengers if entity @s[tag=lockdown.laser_cannon.barrel] run data modify entity @s transformation.right_rotation set from storage lockdown:temp rotation
execute on passengers if entity @s[tag=lockdown.laser_cannon.beam] run data modify entity @s transformation.left_rotation set from storage lockdown:temp rotation
data remove storage lockdown:temp rotation
