# Summon the armor stand and provide it the model data
summon minecraft:armor_stand ~ ~ ~ {Pose:{Head:[0.0f,0.0f,0.1f]},Tags:["ld_glow_effect","ld_block"],Invisible:1b,Invulnerable:1b,Marker:1b,Small:1b,Fire:1000000,ArmorItems:[{},{},{},{id:"minecraft:rabbit_foot",Count:1b,tag:{CustomModelData:0}}]}
data modify entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_glow_effect,distance=..0.1] ArmorItems[3].tag.CustomModelData set from entity @s ArmorItems[3].tag.LockdownData.function_model

# Orient the armor stand
execute if block ~ ~0.23 ~ minecraft:acacia_button[face=ceiling] run scoreboard players set @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_glow_effect,distance=..0.1] ld_rotate_about 2
execute if block ~ ~0.23 ~ minecraft:acacia_button[face=ceiling] run data modify entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_glow_effect,distance=..0.1] Pose.Head set value [0.1f, 0.1f, 0.1f]

execute if block ~ ~0.23 ~ minecraft:acacia_button[face=floor] run scoreboard players set @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_glow_effect,distance=..0.1] ld_rotate_about 2
execute if block ~ ~0.23 ~ minecraft:acacia_button[face=floor] run data modify entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_glow_effect,distance=..0.1] Pose.Head set value [0.1f, 0.1f, 180.1f]

execute if block ~ ~0.23 ~ minecraft:acacia_button[face=wall,facing=north] run scoreboard players set @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_glow_effect,distance=..0.1] ld_rotate_about 3
execute if block ~ ~0.23 ~ minecraft:acacia_button[face=wall,facing=north] run data modify entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_glow_effect,distance=..0.1] Pose.Head set value [90.0f, 0.1f, 0.1f]

execute if block ~ ~0.23 ~ minecraft:acacia_button[face=wall,facing=south] run scoreboard players set @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_glow_effect,distance=..0.1] ld_rotate_about 3
execute if block ~ ~0.23 ~ minecraft:acacia_button[face=wall,facing=south] run data modify entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_glow_effect,distance=..0.1] Pose.Head set value [-90.0f, 0.1f, 0.1f]

execute if block ~ ~0.23 ~ minecraft:acacia_button[face=wall,facing=east] run scoreboard players set @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_glow_effect,distance=..0.1] ld_rotate_about 1
execute if block ~ ~0.23 ~ minecraft:acacia_button[face=wall,facing=east] run data modify entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_glow_effect,distance=..0.1] Pose.Head set value [0.1f, 0.1f, -90.0f]

execute if block ~ ~0.23 ~ minecraft:acacia_button[face=wall,facing=west] run scoreboard players set @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_glow_effect,distance=..0.1] ld_rotate_about 1
execute if block ~ ~0.23 ~ minecraft:acacia_button[face=wall,facing=west] run data modify entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_glow_effect,distance=..0.1] Pose.Head set value [0.1f, 0.0f, 90.0f]
