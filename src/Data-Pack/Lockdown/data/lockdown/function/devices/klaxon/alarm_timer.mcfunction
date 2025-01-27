scoreboard players add @s lockdown.time 1
execute if score @s lockdown.time matches 25.. run function lockdown:devices/klaxon/alarm_play
