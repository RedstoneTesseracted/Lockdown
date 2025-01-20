#execute if block ~ ~ ~ minecraft:acacia_button[powered=true] if entity @s[tag=!ld_on,tag=!ld_turning_off] run function lockdown:devices/lever/heavy_lever_on
#execute if block ~ ~ ~ minecraft:acacia_button[powered=true] if entity @s[tag=ld_on] run function lockdown:devices/lever/heavy_lever_off
#execute if block ~ ~ ~ minecraft:acacia_button[powered=false] if entity @s[tag=ld_turning_off] run tag @s remove ld_turning_off
execute unless block ~ ~ ~ minecraft:acacia_button run function lockdown:devices/lever/heavy_lever_destroy
