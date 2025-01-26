execute store result entity @s ArmorItems[3].tag.CustomModelData int 1 run data get entity @s ArmorItems[3].tag.LockdownData.function_model
tag @s add pressed
tag @s add ld_sending
particle minecraft:enchanted_hit ~ ~0.23 ~ 0.4 0.4 0.4 0 3
function lockdown:devices/update_channels
stopsound @a[distance=..10] block minecraft:block.wooden_button.click_on
playsound minecraft:block.wooden_trapdoor.open block @a ~ ~ ~ 1 0.0
