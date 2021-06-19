# This is a generic function that sets up a custom block

# Summon the armor stand
execute unless score @s ld_id matches 7 align xyz positioned ~0.5 ~-0.23 ~0.5 run summon armor_stand ~ ~ ~ {Tags:["ld_new_block","ld_block"],Invisible:1b,Invulnerable:1b,Marker:1b,Small:1b,Fire:1000000}
#execute if score @s ld_id matches 7 align xyz positioned ~0.5 ~-0.23 ~0.5 run summon armor_stand ~ ~ ~ {Tags:["ld_new_block"],Invisible:1b,Invulnerable:1b,Marker:1b,Small:1b,Passengers:[{id:"minecraft:bee",NoAI:1b,Silent:1b,Invisible:1b,Tags:["ld_invisible","ld_drone_hitbox"],ActiveEffects:[{Id:14,lvl:1,Duration:1000000,ShowParticles:0b}]}]}
execute if score @s ld_id matches 7 align xyz positioned ~0.5 ~ ~0.5 run summon bee ~ ~ ~ {NoAI:1b,Silent:1b,Invisible:1b,Tags:["ld_invisible","ld_drone_hitbox","ld_new_hitbox"],ActiveEffects:[{Id:14,lvl:1,Duration:1000000,ShowParticles:0b}],Passengers:[{id:"minecraft:armor_stand",Invisible:1b,Invulnerable:1b,Marker:1b,Small:1b,Fire:1000000,Tags:["ld_new_block","ld_block"]}]}

# Give the armor stand its item
execute if score @s ld_block_id matches 1 run data merge entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block] {ArmorItems:[{},{},{},{id:"minecraft:birch_button",Count:1b,tag:{LockdownData:{id:0,block_model:0,item_model:0,block_id:1,item_id:0,function_model:0,channel:0},CustomModelData:0}}]}
execute if score @s ld_block_id matches 2 run data merge entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block] {ArmorItems:[{},{},{},{id:"minecraft:rabbit_foot",Count:1b,tag:{LockdownData:{id:0,block_model:0,item_model:0,block_id:1,item_id:0,function_model:0,channel:0},CustomModelData:0}}]}
execute if score @s ld_block_id matches 3 run data merge entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block] {ArmorItems:[{},{},{},{id:"minecraft:gray_glazed_terracotta",Count:1b,tag:{LockdownData:{id:0,block_model:0,item_model:0,block_id:1,item_id:0,function_model:0,channel:0},CustomModelData:0}}]}

# Transfer data to the armor stand's item
execute store result entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block] ArmorItems[3].tag.CustomModelData int 1 run scoreboard players get @s ld_block_model
execute store result entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block] ArmorItems[3].tag.LockdownData.id int 1 run scoreboard players get @s ld_id
execute store result entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block] ArmorItems[3].tag.LockdownData.block_model int 1 run scoreboard players get @s ld_block_model
execute store result entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block] ArmorItems[3].tag.LockdownData.item_model int 1 run scoreboard players get @s ld_item_model
execute store result entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block] ArmorItems[3].tag.LockdownData.block_id int 1 run scoreboard players get @s ld_block_id
execute store result entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block] ArmorItems[3].tag.LockdownData.item_id int 1 run scoreboard players get @s ld_item_id
execute store result entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block] ArmorItems[3].tag.LockdownData.function_model int 1 run scoreboard players get @s ld_fun_model
execute store result entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block] ArmorItems[3].tag.LockdownData.channel int 1 run scoreboard players get @s ld_channel_id
execute store result score @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block] ld_channel run scoreboard players get @s ld_channel_id

# Apply the block's identifying ID
execute if score @s ld_id matches 1 run tag @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block] add ld_heavy_lever
execute if score @s ld_id matches 2 run tag @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block] add ld_keypad
execute if score @s ld_id matches 3 run tag @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block] add ld_keycard_reader
execute if score @s ld_id matches 5 run tag @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block] add ld_alarm
execute if score @s ld_id matches 6 run tag @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block] add ld_big_button
execute if score @s ld_id matches 7 run tag @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block] add ld_drone
execute if score @s ld_id matches 8 run tag @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block] add ld_player_detector
execute if score @s ld_id matches 9 run tag @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block] add ld_mob_detector
execute if score @s ld_id matches 10 run tag @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block] add ld_klaxon
execute if score @s ld_id matches 11 run tag @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block] add ld_laser
execute if score @s ld_id matches 12 run tag @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block] add ld_transmitter
execute if score @s ld_id matches 13 run tag @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block] add ld_receiver
execute if score @s ld_id matches 14 run tag @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block] add ld_force_field
execute if score @s ld_id matches 15 run tag @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block] add ld_turret
execute if score @s ld_id matches 16 run tag @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block] add ld_encoder
execute if score @s ld_id matches 17 run tag @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block] add ld_crafter

# Apply block-specific setup
execute if block ~ ~ ~ minecraft:birch_button as @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block,tag=!ld_drone,tag=!ld_turret] at @s positioned ~ ~0.23 ~ run function lockdown:place_block/birch_button_setup
execute if block ~ ~ ~ minecraft:birch_button as @e[type=minecraft:bee,limit=1,sort=nearest,tag=ld_new_hitbox,tag=ld_drone_hitbox] at @s positioned ~ ~ ~ run function lockdown:place_block/drone_setup
execute if block ~ ~ ~ minecraft:birch_button as @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block,tag=ld_turret] at @s positioned ~ ~0.23 ~ run function lockdown:place_block/turret_setup
execute if block ~ ~ ~ minecraft:gray_glazed_terracotta positioned ~ ~0.23 ~ run function lockdown:place_block/gray_terracotta_setup

# Finish setup
tag @e[type=minecraft:armor_stand,tag=ld_new_block,sort=nearest,limit=1] remove ld_new_block

# Mark the raycasting attempt as a success
scoreboard players set @s ld_success 1
