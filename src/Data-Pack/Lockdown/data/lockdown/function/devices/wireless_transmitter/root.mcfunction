execute if block ~ ~ ~ minecraft:note_block[powered=true] if entity @s[tag=!ld_sending] run function lockdown:devices/transmitter/signal_on
execute if block ~ ~ ~ minecraft:note_block[powered=true] run particle minecraft:enchanted_hit ~ ~0.5 ~ 0.4 0.4 0.4 0 1
execute if block ~ ~ ~ minecraft:note_block[powered=false] if entity @s[tag=ld_sending] run function lockdown:devices/transmitter/signal_off
execute unless block ~ ~ ~ #lockdown:redstone_input run function lockdown:devices/wireless_transmitter/destroy
