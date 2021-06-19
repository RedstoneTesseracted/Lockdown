tag @s add ld_appear_on
execute store result entity @s ArmorItems[3].tag.CustomModelData int 1 run data get entity @s ArmorItems[3].tag.LockdownData.function_model
execute if block ~ ~ ~ minecraft:light_gray_glazed_terracotta run setblock ~ ~ ~ minecraft:redstone_block
