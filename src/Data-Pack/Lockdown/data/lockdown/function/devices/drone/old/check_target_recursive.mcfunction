# This is a recursive function used by the drone to determine if the line-of-sight to a potential candidate target is clear

execute if score $ld_raycast_tries ld_raycast_tries matches ..5 if entity @s[distance=..1] run function lockdown:devices/drone/found_target
scoreboard players add $ld_raycast_tries ld_raycast_tries 1
execute if score $ld_raycast_tries ld_raycast_tries matches ..5 positioned ^ ^ ^1 if block ~ ~ ~ #lockdown:passthrough run function lockdown:devices/drone/check_target_recursive
