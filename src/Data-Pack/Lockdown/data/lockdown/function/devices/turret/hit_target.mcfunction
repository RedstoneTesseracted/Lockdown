# Apply damage
execute as @e[type=#lockdown:hostile,tag=!ld_channel_match,distance=..1] run effect give @s[type=#lockdown:undead] minecraft:instant_health 1 0 true
execute as @e[type=#lockdown:hostile,tag=!ld_channel_match,distance=..1] run effect give @s[type=!#lockdown:undead] minecraft:instant_damage 1 0 true

# Apply fire damage, if applicable
execute if entity @s[tag=ld_flamethrower] run data modify entity @e[tag=!ld_channel_match,distance=..1,limit=1] Fire set value 100s
execute if entity @s[tag=ld_flamethrower] at @e[tag=!ld_channel_match,distance=..1,limit=1] run fill ~ ~ ~ ~ ~ ~ minecraft:fire replace minecraft:air

# End the raycasting
scoreboard players set @s ld_raycast_tries 31
