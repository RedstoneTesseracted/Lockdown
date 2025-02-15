# This function handles acquiring the angles needed to point at the target
# It is run by a temporary marker entity spawned with /execute summon.
# A function macro is used to point at the target position, after which
# we copy the Rotation data to storage

# Point at target position using a function macro
function lockdown:devices/turret/point_at_target/__acquire_angles with storage lockdown:temp turret.pos

# Copy to storage
execute store result storage lockdown:temp rotation.transformation.left_rotation.angle float 0.017453292519943295 run data get entity @s Rotation[0]
execute store result storage lockdown:temp rotation.transformation.right_rotation.angle float 0.017453292519943295 run data get entity @s Rotation[1]

# Now get the ordinary world angles
# function lockdown:devices/turret/point_at_target/__acquire_angles with storage lockdown:temp turret.real_pos
# data modify storage lockdown:temp rotation.Rotation set from entity @s Rotation

# Remove temporary marker entity
kill @s[type=minecraft:marker]
