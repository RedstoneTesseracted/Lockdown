tag @s add ld_granted
tag @s add ld_sending
function lockdown:devices/update_channels
execute store result entity @s ArmorItems[3].tag.CustomModelData int 1 run data get entity @s ArmorItems[3].tag.LockdownData.function_model
playsound minecraft:entity.experience_orb.pickup block @a ~ ~ ~ 1.0 2
particle minecraft:happy_villager ~ ~0.5 ~ 0.25 0.25 0.25 0 2
