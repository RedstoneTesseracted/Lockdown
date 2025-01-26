# Root button function
execute if block ~ ~ ~ minecraft:acacia_button[powered=true] if entity @s[tag=!lockdown.powered] run function lockdown:devices/big_button/press
execute if block ~ ~ ~ minecraft:acacia_button[powered=false] if entity @s[tag=lockdown.powered] run function lockdown:devices/big_button/release
execute unless block ~ ~ ~ minecraft:acacia_button run function lockdown:devices/big_button/destroy
