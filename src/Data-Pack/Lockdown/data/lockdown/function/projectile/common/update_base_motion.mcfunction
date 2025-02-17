# Set motion data from scoreboard
execute store result entity @s Motion[0] double 0.0001 run scoreboard players get @s lockdown.motion.x
execute store result entity @s Motion[1] double 0.0001 run scoreboard players get @s lockdown.motion.y
execute store result entity @s Motion[2] double 0.0001 run scoreboard players get @s lockdown.motion.z
