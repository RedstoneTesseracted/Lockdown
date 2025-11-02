# Interpret the inserted dyes into an integer
scoreboard players set @s ld_result 1

execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:8b,id:"minecraft:white_dye"}]} run scoreboard players add @s ld_result 0
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:8b,id:"minecraft:orange_dye"}]} run scoreboard players add @s ld_result 1
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:8b,id:"minecraft:magenta_dye"}]} run scoreboard players add @s ld_result 2
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:8b,id:"minecraft:light_blue_dye"}]} run scoreboard players add @s ld_result 3
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:8b,id:"minecraft:yellow_dye"}]} run scoreboard players add @s ld_result 4
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:8b,id:"minecraft:lime_dye"}]} run scoreboard players add @s ld_result 5
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:8b,id:"minecraft:pink_dye"}]} run scoreboard players add @s ld_result 6
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:8b,id:"minecraft:gray_dye"}]} run scoreboard players add @s ld_result 7
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:8b,id:"minecraft:light_gray_dye"}]} run scoreboard players add @s ld_result 8
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:8b,id:"minecraft:cyan_dye"}]} run scoreboard players add @s ld_result 9
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:8b,id:"minecraft:purple_dye"}]} run scoreboard players add @s ld_result 10
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:8b,id:"minecraft:blue_dye"}]} run scoreboard players add @s ld_result 11
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:8b,id:"minecraft:brown_dye"}]} run scoreboard players add @s ld_result 12
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:8b,id:"minecraft:green_dye"}]} run scoreboard players add @s ld_result 13
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:8b,id:"minecraft:red_dye"}]} run scoreboard players add @s ld_result 14
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:8b,id:"minecraft:black_dye"}]} run scoreboard players add @s ld_result 15

execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:7b,id:"minecraft:white_dye"}]} run scoreboard players add @s ld_result 0
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:7b,id:"minecraft:orange_dye"}]} run scoreboard players add @s ld_result 16
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:7b,id:"minecraft:magenta_dye"}]} run scoreboard players add @s ld_result 32
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:7b,id:"minecraft:light_blue_dye"}]} run scoreboard players add @s ld_result 48
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:7b,id:"minecraft:yellow_dye"}]} run scoreboard players add @s ld_result 64
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:7b,id:"minecraft:lime_dye"}]} run scoreboard players add @s ld_result 80
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:7b,id:"minecraft:pink_dye"}]} run scoreboard players add @s ld_result 96
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:7b,id:"minecraft:gray_dye"}]} run scoreboard players add @s ld_result 112
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:7b,id:"minecraft:light_gray_dye"}]} run scoreboard players add @s ld_result 128
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:7b,id:"minecraft:cyan_dye"}]} run scoreboard players add @s ld_result 144
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:7b,id:"minecraft:purple_dye"}]} run scoreboard players add @s ld_result 160
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:7b,id:"minecraft:blue_dye"}]} run scoreboard players add @s ld_result 176
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:7b,id:"minecraft:brown_dye"}]} run scoreboard players add @s ld_result 192
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:7b,id:"minecraft:green_dye"}]} run scoreboard players add @s ld_result 208
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:7b,id:"minecraft:red_dye"}]} run scoreboard players add @s ld_result 224
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:7b,id:"minecraft:black_dye"}]} run scoreboard players add @s ld_result 240

execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:6b,id:"minecraft:white_dye"}]} run scoreboard players add @s ld_result 0
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:6b,id:"minecraft:orange_dye"}]} run scoreboard players add @s ld_result 256
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:6b,id:"minecraft:magenta_dye"}]} run scoreboard players add @s ld_result 512
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:6b,id:"minecraft:light_blue_dye"}]} run scoreboard players add @s ld_result 768
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:6b,id:"minecraft:yellow_dye"}]} run scoreboard players add @s ld_result 1024
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:6b,id:"minecraft:lime_dye"}]} run scoreboard players add @s ld_result 1280
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:6b,id:"minecraft:pink_dye"}]} run scoreboard players add @s ld_result 1536
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:6b,id:"minecraft:gray_dye"}]} run scoreboard players add @s ld_result 1792
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:6b,id:"minecraft:light_gray_dye"}]} run scoreboard players add @s ld_result 2048
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:6b,id:"minecraft:cyan_dye"}]} run scoreboard players add @s ld_result 2304
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:6b,id:"minecraft:purple_dye"}]} run scoreboard players add @s ld_result 2560
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:6b,id:"minecraft:blue_dye"}]} run scoreboard players add @s ld_result 2816
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:6b,id:"minecraft:brown_dye"}]} run scoreboard players add @s ld_result 3072
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:6b,id:"minecraft:green_dye"}]} run scoreboard players add @s ld_result 3328
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:6b,id:"minecraft:red_dye"}]} run scoreboard players add @s ld_result 3584
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:6b,id:"minecraft:black_dye"}]} run scoreboard players add @s ld_result 3840

# Transfer the code to the item's channel tag
execute store result block ~ ~ ~ Items[{Slot:4b}].tag.LockdownData.channel int 1 run scoreboard players get @s ld_result

# Add the lore text
data modify block ~ ~ ~ Items[{Slot:4b}].tag.display.Lore set value ['{"text":"Code Assigned","color":"green","italic":"false"}']
# Special case lore (which is most encodable items):
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:4b,tag:{LockdownData:{id:3}}}]} run data modify block ~ ~ ~ Items[{Slot:4b}].tag.display.Lore set value ['{"text":"Code/Channel Assigned","color":"green","italic":"false"}']
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:4b,tag:{LockdownData:{id:5}}}]} run data modify block ~ ~ ~ Items[{Slot:4b}].tag.display.Lore set value ['{"text":"Channel Assigned","color":"green","italic":"false"}']
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:4b,tag:{LockdownData:{id:6}}}]} run data modify block ~ ~ ~ Items[{Slot:4b}].tag.display.Lore set value ['{"text":"Channel Assigned","color":"green","italic":"false"}']
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:4b,tag:{LockdownData:{id:7}}}]} run data modify block ~ ~ ~ Items[{Slot:4b}].tag.display.Lore set value ['{"text":"Code Assigned","color":"green","italic":"false"}','{"text":"Attacks Hostile Mobs","color":"green","italic":"false"}','{"text":"Attacks Unauthorized Players","color":"red","italic":"false"}']
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:4b,tag:{LockdownData:{id:12}}}]} run data modify block ~ ~ ~ Items[{Slot:4b}].tag.display.Lore set value ['{"text":"Channel Assigned","color":"green","italic":"false"}']
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:4b,tag:{LockdownData:{id:13}}}]} run data modify block ~ ~ ~ Items[{Slot:4b}].tag.display.Lore set value ['{"text":"Channel Assigned","color":"green","italic":"false"}']
execute if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:4b,tag:{LockdownData:{id:15}}}]} run data modify block ~ ~ ~ Items[{Slot:4b}].tag.display.Lore set value ['{"text":"Code Assigned","color":"green","italic":"false"}','{"text":"Attacks Hostile Mobs","color":"green","italic":"false"}','{"text":"Attacks Unauthorized Players","color":"red","italic":"false"}']

# Play sound effect
playsound minecraft:block.note_block.pling block @a ~ ~ ~ 1 2
tellraw @a[distance=..5] {"text":"Code assigned!","color":"green"}
