scoreboard players set @s ld_mode 19
data modify entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_field] ArmorItems[3].tag set value {CustomModelData:10053}
fill ^-1 ^-1 ^ ^2 ^3 ^ minecraft:barrier replace air
execute store result score @s ld_result run fill ^-1 ^-1 ^ ^2 ^3 ^ minecraft:air replace barrier
execute if score @s ld_result matches 20 run fill ^-1 ^-1 ^ ^2 ^3 ^ minecraft:barrier replace air
execute unless score @s ld_result matches 20 as @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_field] run function lockdown:devices/force_field/failed
