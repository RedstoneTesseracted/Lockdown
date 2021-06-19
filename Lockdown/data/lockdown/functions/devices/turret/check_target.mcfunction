scoreboard players add @s ld_raycast_tries 1
execute if score @s ld_raycast_tries matches ..10 positioned ^ ^ ^1 unless entity @e[type=#lockdown:hostile,distance=..1,tag=!ld_channel_match] if block ~ ~ ~ #lockdown:passthrough run function lockdown:devices/turret/check_target
execute if score @s ld_raycast_tries matches ..10 positioned ^ ^ ^1 if entity @e[type=#lockdown:hostile,distance=..1,tag=!ld_channel_match] run function lockdown:devices/turret/target_clear
