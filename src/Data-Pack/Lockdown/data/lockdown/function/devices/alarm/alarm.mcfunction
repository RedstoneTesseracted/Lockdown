execute if entity @s[tag=ld_receiving] positioned ~ ~-0.23 ~ run function lockdown:devices/alarm/alarm_shine
execute unless block ~ ~ ~ minecraft:acacia_button run function lockdown:devices/alarm/alarm_destroy
