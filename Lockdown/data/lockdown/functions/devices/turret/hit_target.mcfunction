execute as @e[type=#lockdown:hostile,tag=!ld_channel_match,distance=..1] run effect give @s[type=#lockdown:undead] minecraft:instant_health 1 0 true
execute as @e[type=#lockdown:hostile,tag=!ld_channel_match,distance=..1] run effect give @s[type=!#lockdown:undead] minecraft:instant_damage 1 0 true
scoreboard players set @s ld_raycast_tries 21
