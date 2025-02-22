# This function checks if the projectile is colliding with an entity

tag @e remove lockdown.collide

# Exclude self from collision detection
tag @s add lockdown.exclude
execute on vehicle run tag @s add lockdown.exclude
execute on passengers run tag @s add lockdown.exclude

# Store scores for use below
scoreboard players operation lockdown.origin_uuid1 lockdown.local = @s lockdown.origin_uuid1
scoreboard players operation lockdown.origin_uuid2 lockdown.local = @s lockdown.origin_uuid2
scoreboard players operation lockdown.origin_uuid3 lockdown.local = @s lockdown.origin_uuid3
scoreboard players operation lockdown.origin_uuid4 lockdown.local = @s lockdown.origin_uuid4
scoreboard players operation lockdown.left_origin lockdown.local = @s lockdown.left_origin

# Mark entities within collision box
# Since the (dx, dy, dz) selectors have a minimum selection volume of 1x1x1, we need
# to use two offset boxes to appropriately limit the collision range.
# * First box: [-0.01, -0.01, -0.01] to [0.99, 0.99, 0.99]
# * Second box: [-0.99, -0.99, -0.99] to [0.01, 0.01, 0.01]
# * Union of two boxes: [-0.01, -0.01, -0.01] to [0.01, 0.01, 0.01]
#
# Note that even with this, the projectile's position server-side won't match where
# it is visually.  So, it'll still appear to collide early
scoreboard players set lockdown.total_collisions lockdown.local 0
scoreboard players set lockdown.collided_with_origin lockdown.local 0
# execute on vehicle at @s run particle minecraft:bubble ~ ~ ~ 0.0 0.0 0.0 1.0 4
# execute on vehicle at @s positioned ~-0.01 ~-0.01 ~-0.01 run function lockdown:debug/red_cube
# execute on vehicle at @s positioned ~-0.01 ~-0.01 ~-0.01 positioned ~-0.98 ~-0.98 ~-0.98 run function lockdown:debug/green_cube
execute on vehicle at @s positioned ~-0.01 ~-0.01 ~-0.01 as @e[type=!#lockdown:laser_ignore,dx=0,dy=0,dz=0,tag=!lockdown.laser] positioned ~-0.98 ~-0.98 ~-0.98 if entity @s[dx=0,dy=0,dz=0] run function lockdown:projectile/laser/decide_collision

# Update collision with origin status
execute if score @s lockdown.left_origin matches 0 if score lockdown.collided_with_origin lockdown.local matches 0 run scoreboard players set @s lockdown.left_origin 1

# Return result code
return run scoreboard players get lockdown.total_collisions lockdown.local
