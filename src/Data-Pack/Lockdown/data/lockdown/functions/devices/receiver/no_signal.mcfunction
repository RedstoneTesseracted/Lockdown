tag @s remove ld_appear_on
execute store result entity @s ArmorItems[3].tag.CustomModelData int 1 run data get entity @s ArmorItems[3].tag.LockdownData.block_model
execute if block ~ ~ ~ minecraft:redstone_block run setblock ~ ~ ~ minecraft:light_gray_glazed_terracotta
