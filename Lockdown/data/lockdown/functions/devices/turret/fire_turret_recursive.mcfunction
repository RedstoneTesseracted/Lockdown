scoreboard players add @s ld_raycast_tries 1
execute unless entity @s[tag=ld_flamethrower] run particle dust 1 0 0 1 ~ ~ ~ 0.1 0.1 0.1 0 4
execute if entity @s[tag=ld_flamethrower] run particle flame ~ ~ ~ 0.1 0.1 0.1 0 4
execute if score @s ld_raycast_tries matches 0..30 positioned ^ ^ ^0.5 if block ~ ~ ~ #lockdown:passthrough unless entity @e[type=#lockdown:hostile,tag=!ld_channel_match,distance=..1] run function lockdown:devices/turret/fire_turret_recursive
execute if score @s ld_raycast_tries matches 0..30 positioned ^ ^ ^0.5 if block ~ ~ ~ #lockdown:passthrough if entity @e[type=#lockdown:hostile,tag=!ld_channel_match,distance=..1] run function lockdown:devices/turret/hit_target
