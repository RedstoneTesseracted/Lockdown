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
scoreboard players set lockdown.total_collisions lockdown.local 0
scoreboard players set lockdown.collided_with_origin lockdown.local 0
execute on vehicle at @s as @e[type=!#lockdown:laser_ignore,dx=0,dy=0,dz=0,tag=!lockdown.laser] run function lockdown:projectile/laser/decide_collision

# Update collision with origin status
execute if score @s lockdown.left_origin matches 0 if score lockdown.collided_with_origin lockdown.local matches 0 run scoreboard players set @s lockdown.left_origin 1

# Return result code
return run scoreboard players get lockdown.total_collisions lockdown.local
