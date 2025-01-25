execute store result entity @s ArmorItems[3].tag.CustomModelData int 1 run data get entity @s ArmorItems[3].tag.LockdownData.block_model
tag @s remove ld_on
tag @s add ld_turning_off
stopsound @a[distance=..10] block minecraft:block.wooden_button.click_off
playsound minecraft:block.iron_trapdoor.close block @a ~ ~ ~ 1 0.0
