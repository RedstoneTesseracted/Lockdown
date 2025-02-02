# Root function run by all wireless transmitters
execute if block ~ ~ ~ minecraft:redstone_lamp[lit=true] if entity @s[tag=!lockdown.channel.sending] run function lockdown:devices/wireless_transmitter/signal_on
execute if block ~ ~ ~ minecraft:redstone_lamp[lit=false] if entity @s[tag=lockdown.channel.sending] run function lockdown:devices/wireless_transmitter/signal_off
execute if block ~ ~ ~ minecraft:redstone_lamp[lit=true] run particle minecraft:enchanted_hit ~ ~0.5 ~ 0.4 0.4 0.4 0 1
execute unless block ~ ~ ~ minecraft:redstone_lamp run function lockdown:devices/wireless_transmitter/destroy
