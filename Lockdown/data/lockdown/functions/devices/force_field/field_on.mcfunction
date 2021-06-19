tag @s add ld_projecting
execute store result entity @s ArmorItems[3].tag.CustomModelData int 1 run data get entity @s ArmorItems[3].tag.LockdownData.function_model
playsound minecraft:block.beacon.activate block @a ~ ~ ~ 1 2

# Summon the armor stand and give it its item data
summon armor_stand ~ ~2 ~ {Tags:["ld_block","ld_field","ld_new_field"],NoGravity:1b,Invulnerable:1b,Small:1b,Invisible:1b,Marker:1b,Fire:1000000,ArmorItems:[{},{},{},{id:"minecraft:rabbit_foot",Count:1b,tag:{CustomModelData:10034,LockdownMode:0}}]}

# Rotate the armor stand accordingly
execute if score @s ld_facing matches 1 as @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] at @s run tp @s ~ ~ ~ 0 ~
execute if score @s ld_facing matches 2 as @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] at @s run tp @s ~ ~ ~ 90 ~
execute if score @s ld_facing matches 3 as @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] at @s run tp @s ~ ~ ~ 180 ~
execute if score @s ld_facing matches 4 as @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] at @s run tp @s ~ ~ ~ -90 ~


# Spawn the force field according to the note block's setting, but only if there is enough room.
execute if block ~ ~ ~ minecraft:note_block[note=0] positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] run function lockdown:devices/force_field/check/check11
execute if block ~ ~ ~ minecraft:note_block[note=1] positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] run function lockdown:devices/force_field/check/check12
execute if block ~ ~ ~ minecraft:note_block[note=2] positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] run function lockdown:devices/force_field/check/check13
execute if block ~ ~ ~ minecraft:note_block[note=3] positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] run function lockdown:devices/force_field/check/check14
execute if block ~ ~ ~ minecraft:note_block[note=4] positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] run function lockdown:devices/force_field/check/check15
execute if block ~ ~ ~ minecraft:note_block[note=5] positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] run function lockdown:devices/force_field/check/check21
execute if block ~ ~ ~ minecraft:note_block[note=6] positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] run function lockdown:devices/force_field/check/check22
execute if block ~ ~ ~ minecraft:note_block[note=7] positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] run function lockdown:devices/force_field/check/check23
execute if block ~ ~ ~ minecraft:note_block[note=8] positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] run function lockdown:devices/force_field/check/check24
execute if block ~ ~ ~ minecraft:note_block[note=9] positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] run function lockdown:devices/force_field/check/check25
execute if block ~ ~ ~ minecraft:note_block[note=10] positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] run function lockdown:devices/force_field/check/check31
execute if block ~ ~ ~ minecraft:note_block[note=11] positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] run function lockdown:devices/force_field/check/check32
execute if block ~ ~ ~ minecraft:note_block[note=12] positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] run function lockdown:devices/force_field/check/check33
execute if block ~ ~ ~ minecraft:note_block[note=13] positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] run function lockdown:devices/force_field/check/check34
execute if block ~ ~ ~ minecraft:note_block[note=14] positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] run function lockdown:devices/force_field/check/check35
execute if block ~ ~ ~ minecraft:note_block[note=15] positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] run function lockdown:devices/force_field/check/check41
execute if block ~ ~ ~ minecraft:note_block[note=16] positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] run function lockdown:devices/force_field/check/check42
execute if block ~ ~ ~ minecraft:note_block[note=17] positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] run function lockdown:devices/force_field/check/check43
execute if block ~ ~ ~ minecraft:note_block[note=18] positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] run function lockdown:devices/force_field/check/check44
execute if block ~ ~ ~ minecraft:note_block[note=19] positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] run function lockdown:devices/force_field/check/check45
execute if block ~ ~ ~ minecraft:note_block[note=20] positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] run function lockdown:devices/force_field/check/check51
execute if block ~ ~ ~ minecraft:note_block[note=21] positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] run function lockdown:devices/force_field/check/check52
execute if block ~ ~ ~ minecraft:note_block[note=22] positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] run function lockdown:devices/force_field/check/check53
execute if block ~ ~ ~ minecraft:note_block[note=23] positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] run function lockdown:devices/force_field/check/check54
execute if block ~ ~ ~ minecraft:note_block[note=24] positioned ~ ~2 ~ at @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] run function lockdown:devices/force_field/check/check55

tag @e[type=armor_stand,limit=1,sort=nearest,tag=ld_new_field] remove ld_new_field
