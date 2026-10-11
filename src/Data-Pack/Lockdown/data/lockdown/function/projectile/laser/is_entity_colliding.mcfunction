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

# Check positions along the path between the projectile's previous and current position.
# This check isn't super cheap, so we only activate it if there's a non-ignored entity
# within five blocks.
scoreboard players set lockdown.total_collisions lockdown.local 0
scoreboard players set lockdown.collided_with_origin lockdown.local 0
#execute on vehicle at @s run particle minecraft:bubble ~ ~ ~ 0.0 0.0 0.0 1.0 4
#execute on vehicle at @s run function lockdown:debug/collision_cube
execute on vehicle at @s if entity @e[type=!#lockdown:laser_ignore,tag=!lockdown.laser,distance=..5] run function lockdown:projectile/laser/check_collisions_along_trail

# Update collision with origin status.
# Having the projectile be outside the origin's hitbox for 1 tick proved to not be enough, as it
# was still possible to collide the play if they we're sprinting forward.  So, now the projectile
# needs to be outside the origin's hitbox for a total of TWO ticks
execute if score @s lockdown.left_origin matches ..1 if score lockdown.collided_with_origin lockdown.local matches 0 run scoreboard players add @s lockdown.left_origin 1

#tellraw @a ["Total Collisions: ", {score: {name: "lockdown.total_collisions", objective: "lockdown.local"}}, ", Collided With Origin: ", {score: {name: "lockdown.collided_with_origin", objective: "lockdown.local"}}, ", Left Origin:", {score: {name: "lockdown.left_origin", objective: "lockdown.local"}}]

# Return result code
return run scoreboard players get lockdown.total_collisions lockdown.local
