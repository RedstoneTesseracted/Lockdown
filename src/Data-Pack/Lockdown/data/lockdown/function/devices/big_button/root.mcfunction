execute if block ~ ~ ~ minecraft:acacia_button[powered=true] if entity @s[tag=!pressed] run function lockdown:devices/button/big_button_down
execute if block ~ ~ ~ minecraft:acacia_button[powered=false] if entity @s[tag=pressed] run function lockdown:devices/button/big_button_up
execute unless block ~ ~ ~ minecraft:acacia_button run function lockdown:devices/button/big_button_destroy
