# This function decides whether an entity is viable for collision and tags it accordingly

# Self is not viable
execute if entity @s[tag=lockdown.exclude] run return 0

# Origin is not viable if we haven't left it yet
execute if score lockdown.left_origin lockdown.local matches 0 if function lockdown:projectile/laser/is_origin run return run scoreboard players set lockdown.collided_with_origin lockdown.local 1

# Must not be a spectator
execute if entity @s[gamemode=spectator] run return 0

# All checks passed - viable for collision
tag @s add lockdown.collide
scoreboard players add lockdown.total_collisions lockdown.local 1
