# Root function for all laser projectors
execute if block ~ ~ ~ minecraft:redstone_lamp[lit=true] if entity @s[tag=!lockdown.powered] run function lockdown:devices/laser_projector/activate
execute if block ~ ~ ~ minecraft:redstone_lamp[lit=false] if entity @s[tag=lockdown.powered] run function lockdown:devices/laser_projector/deactivate
execute if entity @s[tag=lockdown.powered] run function lockdown:devices/laser_projector/firing
execute unless block ~ ~ ~ minecraft:redstone_lamp run function lockdown:devices/laser_projector/destroy
