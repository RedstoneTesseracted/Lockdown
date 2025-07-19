# Acquire's the target's position relative to the turret's own coordinate system

# Obtain target position relative to non-rotated frame
execute store result score lockdown.cx lockdown.local run data get entity @s Pos[0] 70.0
execute store result score lockdown.cy lockdown.local run data get entity @s Pos[1] 70.0
execute store result score lockdown.cz lockdown.local run data get entity @s Pos[2] 70.0
execute on passengers if entity @s[type=minecraft:bee] on target run function lockdown:devices/turret/point_at_target/get_global_target_position
scoreboard players operation lockdown.x lockdown.local -= lockdown.cx lockdown.local
scoreboard players operation lockdown.y lockdown.local -= lockdown.cy lockdown.local
scoreboard players operation lockdown.z lockdown.local -= lockdown.cz lockdown.local

# Transform to rotated frame
execute if entity @s[tag=lockdown.direction.down] run function lockdown:devices/turret/transform_position/down
execute if entity @s[tag=lockdown.direction.up] run function lockdown:devices/turret/transform_position/up
execute if entity @s[tag=lockdown.direction.north] run function lockdown:devices/turret/transform_position/north
execute if entity @s[tag=lockdown.direction.south] run function lockdown:devices/turret/transform_position/south
execute if entity @s[tag=lockdown.direction.west] run function lockdown:devices/turret/transform_position/west
execute if entity @s[tag=lockdown.direction.east] run function lockdown:devices/turret/transform_position/east

# Convert back to global coordinates that we can point at
scoreboard players operation lockdown.x lockdown.local += lockdown.cx lockdown.local
scoreboard players operation lockdown.y lockdown.local += lockdown.cy lockdown.local
scoreboard players operation lockdown.z lockdown.local += lockdown.cz lockdown.local

#title @a actionbar [{text:"X: "},{"score": {"name": "lockdown.x","objective": "lockdown.local"}},{text:", Y: "},{"score": {"name": "lockdown.y","objective": "lockdown.local"}},{text:", Z: "},{"score": {"name": "lockdown.z","objective": "lockdown.local"}}]

# Transfer to storage for later use with function macros
data modify storage lockdown:temp turret.pos set value {x: 0.0d, y: 0.0d, z: 0.0d}
execute store result storage lockdown:temp turret.pos.x double 0.014285714285714285 run scoreboard players get lockdown.x lockdown.local
execute store result storage lockdown:temp turret.pos.y double 0.014285714285714285 run scoreboard players get lockdown.y lockdown.local
execute store result storage lockdown:temp turret.pos.z double 0.014285714285714285 run scoreboard players get lockdown.z lockdown.local
