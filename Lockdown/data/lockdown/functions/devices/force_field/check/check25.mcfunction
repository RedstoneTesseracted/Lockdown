scoreboard players set @s ld_mode 9
data modify entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_field] ArmorItems[3].tag set value {CustomModelData:10043}
fill ^ ^-1 ^ ^1 ^3 ^ minecraft:barrier replace air
execute store result score @s ld_result run fill ^ ^-1 ^ ^1 ^3 ^ minecraft:air replace barrier
execute if score @s ld_result matches 10 run fill ^ ^-1 ^ ^1 ^3 ^ minecraft:barrier replace air
execute unless score @s ld_result matches 10 as @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_field] run function lockdown:devices/force_field/failed
