tag @s remove ld_found_mob
execute store result entity @s ArmorItems[3].tag.CustomModelData int 1 run data get entity @s ArmorItems[3].tag.LockdownData.block_model
execute if block ~ ~ ~ minecraft:redstone_block run setblock ~ ~ ~ minecraft:light_gray_glazed_terracotta
