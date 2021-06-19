tag @s add ld_drone_hostile
execute store result entity @s ArmorItems[3].tag.CustomModelData int 1 run data get entity @s ArmorItems[3].tag.LockdownData.function_model
playsound minecraft:drone_target block @a ~ ~ ~ 1.0 1.0
