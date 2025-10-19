# This function is used by ./force_field to remove an active force field

execute if score @s ld_mode matches 0 positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_field,distance=..1] positioned ~ ~-1 ~ run fill ^ ^ ^ ^ ^ ^ minecraft:air replace barrier
execute if score @s ld_mode matches 1 positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_field,distance=..1] positioned ~ ~-1 ~ run fill ^ ^ ^ ^ ^1 ^ minecraft:air replace barrier
execute if score @s ld_mode matches 2 positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_field,distance=..1] positioned ~ ~-1 ~ run fill ^ ^ ^ ^ ^2 ^ minecraft:air replace barrier
execute if score @s ld_mode matches 3 positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_field,distance=..1] positioned ~ ~-1 ~ run fill ^ ^ ^ ^ ^3 ^ minecraft:air replace barrier
execute if score @s ld_mode matches 4 positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_field,distance=..1] positioned ~ ~-1 ~ run fill ^ ^ ^ ^ ^4 ^ minecraft:air replace barrier
execute if score @s ld_mode matches 5 positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_field,distance=..1] positioned ~ ~-1 ~ run fill ^ ^ ^ ^1 ^ ^ minecraft:air replace barrier
execute if score @s ld_mode matches 6 positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_field,distance=..1] positioned ~ ~-1 ~ run fill ^ ^ ^ ^1 ^1 ^ minecraft:air replace barrier
execute if score @s ld_mode matches 7 positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_field,distance=..1] positioned ~ ~-1 ~ run fill ^ ^ ^ ^1 ^2 ^ minecraft:air replace barrier
execute if score @s ld_mode matches 8 positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_field,distance=..1] positioned ~ ~-1 ~ run fill ^ ^ ^ ^1 ^3 ^ minecraft:air replace barrier
execute if score @s ld_mode matches 9 positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_field,distance=..1] positioned ~ ~-1 ~ run fill ^ ^ ^ ^1 ^4 ^ minecraft:air replace barrier
execute if score @s ld_mode matches 10 positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_field,distance=..1] positioned ~ ~-1 ~ run fill ^-1 ^ ^ ^1 ^ ^ minecraft:air replace barrier
execute if score @s ld_mode matches 11 positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_field,distance=..1] positioned ~ ~-1 ~ run fill ^-1 ^ ^ ^1 ^1 ^ minecraft:air replace barrier
execute if score @s ld_mode matches 12 positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_field,distance=..1] positioned ~ ~-1 ~ run fill ^-1 ^ ^ ^1 ^2 ^ minecraft:air replace barrier
execute if score @s ld_mode matches 13 positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_field,distance=..1] positioned ~ ~-1 ~ run fill ^-1 ^ ^ ^1 ^3 ^ minecraft:air replace barrier
execute if score @s ld_mode matches 14 positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_field,distance=..1] positioned ~ ~-1 ~ run fill ^-1 ^ ^ ^1 ^4 ^ minecraft:air replace barrier
execute if score @s ld_mode matches 15 positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_field,distance=..1] positioned ~ ~-1 ~ run fill ^-1 ^ ^ ^2 ^ ^ minecraft:air replace barrier
execute if score @s ld_mode matches 16 positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_field,distance=..1] positioned ~ ~-1 ~ run fill ^-1 ^ ^ ^2 ^1 ^ minecraft:air replace barrier
execute if score @s ld_mode matches 17 positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_field,distance=..1] positioned ~ ~-1 ~ run fill ^-1 ^ ^ ^2 ^2 ^ minecraft:air replace barrier
execute if score @s ld_mode matches 18 positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_field,distance=..1] positioned ~ ~-1 ~ run fill ^-1 ^ ^ ^2 ^3 ^ minecraft:air replace barrier
execute if score @s ld_mode matches 19 positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_field,distance=..1] positioned ~ ~-1 ~ run fill ^-1 ^ ^ ^2 ^4 ^ minecraft:air replace barrier
execute if score @s ld_mode matches 20 positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_field,distance=..1] positioned ~ ~-1 ~ run fill ^-2 ^ ^ ^2 ^ ^ minecraft:air replace barrier
execute if score @s ld_mode matches 21 positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_field,distance=..1] positioned ~ ~-1 ~ run fill ^-2 ^ ^ ^2 ^1 ^ minecraft:air replace barrier
execute if score @s ld_mode matches 22 positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_field,distance=..1] positioned ~ ~-1 ~ run fill ^-2 ^ ^ ^2 ^2 ^ minecraft:air replace barrier
execute if score @s ld_mode matches 23 positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_field,distance=..1] positioned ~ ~-1 ~ run fill ^-2 ^ ^ ^2 ^3 ^ minecraft:air replace barrier
execute if score @s ld_mode matches 24 positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_field,distance=..1] positioned ~ ~-1 ~ run fill ^-2 ^ ^ ^2 ^4 ^ minecraft:air replace barrier

execute positioned ~ ~2 ~ run kill @e[type=minecraft:armor_stand,limit=1,sort=nearest,distance=..1,tag=ld_field]
