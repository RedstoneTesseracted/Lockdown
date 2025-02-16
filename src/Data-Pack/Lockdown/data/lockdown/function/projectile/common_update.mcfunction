# This function runs common updates for fake projectile entities
# Run BY the projectile entity

# Update timer
scoreboard players remove @s lockdown.time 1

# Update motion
# execute store result entity @s Motion[0] double 0.01 run scoreboard players get @s lockdown.motion.x
# execute store result entity @s Motion[1] double 0.01 run scoreboard players get @s lockdown.motion.y
# execute store result entity @s Motion[2] double 0.01 run scoreboard players get @s lockdown.motion.z
