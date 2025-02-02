# Root function for all alarm entities
execute if entity @s[tag=lockdown.powered,tag=!lockdown.channel.receiving] run function lockdown:devices/alarm/stop
execute if entity @s[tag=!lockdown.powered,tag=lockdown.channel.receiving] run function lockdown:devices/alarm/start
execute if entity @s[tag=lockdown.powered] run function lockdown:devices/alarm/alarm_glow
