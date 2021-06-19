execute if entity @e[type=!#lockdown:non_mobs,distance=..5] if entity @s[tag=!ld_found_mob] run function lockdown:devices/mob_detector/found_mob
execute unless entity @e[type=!#lockdown:non_mobs,distance=..5] if entity @s[tag=ld_found_mob] run function lockdown:devices/mob_detector/no_mob
execute unless block ~ ~ ~ #lockdown:redstone_output run function lockdown:devices/mob_detector/mob_detector_destroy
