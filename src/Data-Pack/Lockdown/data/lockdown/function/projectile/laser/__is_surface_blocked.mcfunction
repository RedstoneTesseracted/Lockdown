# Used by lockdown:projectile/laser/is_surface_blocked to shift execution context to the moving entity
# Checks whether the moving entity is about to collide with a block

# At this scale, the armor stand's width and height are equal to:
# width*scale = 0.5*0.12658227848101264=0.06329113924050632
# height*scale = 0.25
execute if score @s lockdown.motion.x matches 1.. unless block ~0.05 ~ ~ #lockdown:passthrough run return 1
execute if score @s lockdown.motion.x matches ..-1 unless block ~-0.05 ~ ~ #lockdown:passthrough run return 1
execute if score @s lockdown.motion.y matches 1.. unless block ~ ~0.26 ~ #lockdown:passthrough run return 1
execute if score @s lockdown.motion.y matches ..-1 unless block ~ ~-0.05 ~ #lockdown:passthrough run return 1
execute if score @s lockdown.motion.z matches 1.. unless block ~ ~ ~0.05 #lockdown:passthrough run return 1
execute if score @s lockdown.motion.z matches ..-1 unless block ~ ~ ~-0.05 #lockdown:passthrough run return 1

# No collision detected
return 0
