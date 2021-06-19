scoreboard players add @s ld_time 1
execute if entity @s[scores={ld_time=30..}] run function lockdown:devices/klaxon/alarm_play
