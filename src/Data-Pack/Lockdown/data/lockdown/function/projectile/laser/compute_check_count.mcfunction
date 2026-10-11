# Pre 26.3 implementation
#
# This function calculates the number of checks that need to be performed by check_collisions_along_trail.
# This is done by dividing the distance traveled since last tick by 0.2.
#
# Prior to 26.3, we didn't have a convenient way to calculate square-root or vector norms, so this
# implementation tortures a display entity into calculating a vector norm by accident.  I won't get into
# specifics, but it essentially takes advantage of the singular value decomposition implicitly done by
# display entities when you give them a full 4x4 transformation matrix.
#
# In 26.3 and above, overlays replace this function with a an implementation that uses context float providers.

# Compute components of travel vector
execute store result score lockdown.x lockdown.local run data get entity @s Pos[0] 71.5
execute store result score lockdown.y lockdown.local run data get entity @s Pos[1] 71.5
execute store result score lockdown.z lockdown.local run data get entity @s Pos[2] 71.5
scoreboard players operation lockdown.x lockdown.local -= @s lockdown.last_x
scoreboard players operation lockdown.y lockdown.local -= @s lockdown.last_y
scoreboard players operation lockdown.z lockdown.local -= @s lockdown.last_z

data modify storage lockdown:temp args set value [\
0.0f, 0.0f, 0.0f, 0.0f,\
0.0f, 0.0f, 0.0f, 0.0f,\
0.0f, 0.0f, 0.0f, 0.0f,\
0.0f, 0.0f, 0.0f, 1.0f]
execute store result storage lockdown:temp args[0] float 0.013986013986013986 run scoreboard players get lockdown.x lockdown.local
execute store result storage lockdown:temp args[4] float 0.013986013986013986 run scoreboard players get lockdown.y lockdown.local
execute store result storage lockdown:temp args[8] float 0.013986013986013986 run scoreboard players get lockdown.z lockdown.local
execute summon minecraft:block_display run function lockdown:projectile/laser/__compute_check_count
