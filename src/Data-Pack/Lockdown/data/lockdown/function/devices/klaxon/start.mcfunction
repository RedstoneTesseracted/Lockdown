# This function handles the klaxon's activation

tag @s add lockdown.powered
scoreboard players set @s lockdown.time 25
data modify entity @s item.components."minecraft:item_model" set value "lockdown:machine/klaxon_on"
