execute if entity @s[tag=ld_receiving,tag=!ld_appear_on] run function lockdown:devices/receiver/found_signal
execute if entity @s[tag=!ld_receiving,tag=ld_appear_on] run function lockdown:devices/receiver/no_signal
execute unless block ~ ~ ~ #lockdown:redstone_output run function lockdown:devices/receiver/destroy
