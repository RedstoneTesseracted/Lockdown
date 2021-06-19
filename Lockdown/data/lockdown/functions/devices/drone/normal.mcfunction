tag @s remove ld_drone_hostile
execute store result entity @s ArmorItems[3].tag.CustomModelData int 1 run data get entity @s ArmorItems[3].tag.LockdownData.block_model
data modify entity @e[type=minecraft:bee,tag=ld_drone_hitbox,distance=..1,limit=1,sort=nearest] NoAI set value 1b
