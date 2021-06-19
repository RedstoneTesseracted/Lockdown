tag @s add ld_pew
execute store result entity @s ArmorItems[3].tag.CustomModelData int 1 run data get entity @s ArmorItems[3].tag.LockdownData.function_model
playsound minecraft:entity.zombie.infect block @a ~ ~ ~ 0.75 2
