# Root function for all alarm entities
execute if entity @s[tag=lockdown.powered] run function lockdown:devices/alarm/alarm_glow
