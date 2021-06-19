scoreboard players set @s ld_mode 23
data modify entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_field] ArmorItems[3].tag set value {CustomModelData:10057}
fill ^-2 ^-1 ^ ^2 ^2 ^ minecraft:barrier replace air
execute store result score @s ld_result run fill ^-2 ^-1 ^ ^2 ^2 ^ minecraft:air replace barrier
execute if score @s ld_result matches 20 run fill ^-2 ^-1 ^ ^2 ^2 ^ minecraft:barrier replace air
execute unless score @s ld_result matches 20 as @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_field] run function lockdown:devices/force_field/failed
