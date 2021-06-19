effect give @s[type=#lockdown:undead] minecraft:instant_health 1 0 true
effect give @s[type=!#lockdown:undead] minecraft:instant_damage 1 0 true
execute at @s run particle dust 1 0 0 1 ~ ~1 ~ 0.5 0.5 0.5 0 30

execute if entity @s[type=minecraft:player] run advancement grant @s only lockdown:lockdown/angry_drone

scoreboard players set $ld_raycast_tries ld_raycast_tries 50
