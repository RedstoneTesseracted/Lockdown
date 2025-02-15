# Stores the target's position

# These numbers are used to compute the standard angles for the beam entity
data modify storage lockdown:temp turret.real_pos set value {x: 0.0d, y: 0.0d, z: 0.0d}
data modify storage lockdown:temp turret.real_pos.x set from entity @s Pos[0]
data modify storage lockdown:temp turret.real_pos.y set from entity @s Pos[1]
data modify storage lockdown:temp turret.real_pos.z set from entity @s Pos[2]

# These numbers are used for arithmetic in acquire_target_position to compute the target's position relative to the turret
execute store result score lockdown.x lockdown.local run data get storage lockdown:temp turret.real_pos.x 70.0
execute store result score lockdown.y lockdown.local run data get storage lockdown:temp turret.real_pos.y 70.0
execute store result score lockdown.z lockdown.local run data get storage lockdown:temp turret.real_pos.z 70.0
