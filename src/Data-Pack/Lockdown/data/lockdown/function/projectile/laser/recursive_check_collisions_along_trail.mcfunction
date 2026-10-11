# Recursive part of check_collisions_along_trail that handles running multiple checks in a loop

# Mark entities within collision box
# Since the (dx, dy, dz) selectors have a minimum selection volume of 1x1x1, we need
# to use two offset boxes to appropriately limit the collision range.
# * First box: [-0.1, -0.1, -0.1] to [0.9, 0.9, 0.9]
# * Second box: [-0.9, -0.9, -0.9] to [0.1, 0.1, 0.1]
# * Union of two boxes: [-0.1, -0.1, -0.1] to [0.1, 0.1, 0.1]
#
scoreboard players set lockdown.found_collision lockdown.local 0
execute positioned ~-0.1 ~-0.1 ~-0.1 as @e[type=!#lockdown:laser_ignore,dx=0,dy=0,dz=0,tag=!lockdown.laser] positioned ~-0.8 ~-0.8 ~-0.8 if entity @s[dx=0,dy=0,dz=0] store result score lockdown.found_collision lockdown.local run function lockdown:projectile/laser/decide_collision

# Instantly terminate loop if we've found a collision
execute if score lockdown.found_collision lockdown.local matches 1 run scoreboard players set lockdown.count lockdown.local 1

# Decrement counter and run again if there are still iterations left in the loop
scoreboard players remove lockdown.count lockdown.local 1
execute if score lockdown.count lockdown.local matches 1.. positioned ^ ^ ^0.2 run function lockdown:projectile/laser/recursive_check_collisions_along_trail
