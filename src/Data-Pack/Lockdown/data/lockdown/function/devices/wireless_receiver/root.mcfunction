# Root function executed by all wireless receiver custom blocks
execute if entity @s[tag=lockdown.channel.receiving,tag=!lockdown.powered] run function lockdown:devices/wireless_receiver/found_signal
execute if entity @s[tag=!lockdown.channel.receiving,tag=lockdown.powered] run function lockdown:devices/wireless_receiver/no_signal
execute unless block ~ ~ ~ #lockdown:wireless_receiver_base run function lockdown:devices/wireless_receiver/destroy
