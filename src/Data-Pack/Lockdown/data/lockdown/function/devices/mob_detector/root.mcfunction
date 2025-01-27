execute if entity @e[type=!#lockdown:mob_detector_ignore,distance=..5] if entity @s[tag=!lockdown.detected] run function lockdown:devices/mob_detector/found_mob
execute unless entity @e[type=!#lockdown:mob_detector_ignore,distance=..5] if entity @s[tag=lockdown.detected] run function lockdown:devices/mob_detector/no_mob
execute unless block ~ ~ ~ #lockdown:redstone_output run function lockdown:devices/mob_detector/destroy
