tag @s remove ld_pew
execute store result entity @s ArmorItems[3].tag.CustomModelData int 1 run data get entity @s ArmorItems[3].tag.LockdownData.block_model
playsound minecraft:block.fire.extinguish block @a ~ ~ ~ 0.75 0
