scoreboard players add @s ld_raycast_tries 1
particle dust 1 0 0 1 ~ ~ ~ 0.1 0.1 0.1 0 4
execute if score @s ld_raycast_tries matches 0..20 positioned ^ ^ ^0.5 if block ~ ~ ~ #lockdown:passthrough unless entity @e[type=#lockdown:hostile,tag=!ld_channel_match,distance=..1] run function lockdown:devices/turret/fire_turret_recursive
execute if score @s ld_raycast_tries matches 0..20 positioned ^ ^ ^0.5 if block ~ ~ ~ #lockdown:passthrough if entity @e[type=#lockdown:hostile,tag=!ld_channel_match,distance=..1] run function lockdown:devices/turret/hit_target
