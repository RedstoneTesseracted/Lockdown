# This is a recursive function used by the drone to fire at a target

execute if score $ld_raycast_tries ld_raycast_tries matches ..50 if entity @e[tag=ld_drone_target,distance=..1] run function lockdown:devices/drone/hit_target
scoreboard players add $ld_raycast_tries ld_raycast_tries 1
execute unless entity @s[tag=ld_flamethrower] run particle dust 1.0 0.0 0.0 1.0 ^ ^ ^0.1 0.0 0.0 0.0 0 2
execute if entity @s[tag=ld_flamethrower] run particle flame ^ ^ ^0.1 0.0 0.0 0.0 0 2
execute if score $ld_raycast_tries ld_raycast_tries matches ..50 positioned ^ ^ ^0.1 if block ~ ~ ~ #lockdown:passthrough run function lockdown:devices/drone/drone_fire_recursive
