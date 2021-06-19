execute store result entity @s ArmorItems[3].tag.CustomModelData int 1 run data get entity @s ArmorItems[3].tag.LockdownData.block_model
tag @s remove pressed
tag @s remove ld_sending
function lockdown:devices/update_channels
stopsound @a[distance=..10] block minecraft:block.wooden_button.click_off
playsound minecraft:block.wooden_trapdoor.close block @a ~ ~ ~ 1 0.0
