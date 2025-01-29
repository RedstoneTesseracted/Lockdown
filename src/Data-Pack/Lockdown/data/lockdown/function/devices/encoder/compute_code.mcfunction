# Interpret the inserted dyes into an integer
scoreboard players set lockdown.channel lockdown.local 1

execute if items block ~ ~ ~ container.8 minecraft:white_dye run scoreboard players add lockdown.channel lockdown.local 0
execute if items block ~ ~ ~ container.8 minecraft:orange_dye run scoreboard players add lockdown.channel lockdown.local 1
execute if items block ~ ~ ~ container.8 minecraft:magenta_dye run scoreboard players add lockdown.channel lockdown.local 2
execute if items block ~ ~ ~ container.8 minecraft:light_blue_dye run scoreboard players add lockdown.channel lockdown.local 3
execute if items block ~ ~ ~ container.8 minecraft:yellow_dye run scoreboard players add lockdown.channel lockdown.local 4
execute if items block ~ ~ ~ container.8 minecraft:lime_dye run scoreboard players add lockdown.channel lockdown.local 5
execute if items block ~ ~ ~ container.8 minecraft:pink_dye run scoreboard players add lockdown.channel lockdown.local 6
execute if items block ~ ~ ~ container.8 minecraft:gray_dye run scoreboard players add lockdown.channel lockdown.local 7
execute if items block ~ ~ ~ container.8 minecraft:light_gray_dye run scoreboard players add lockdown.channel lockdown.local 8
execute if items block ~ ~ ~ container.8 minecraft:cyan_dye run scoreboard players add lockdown.channel lockdown.local 9
execute if items block ~ ~ ~ container.8 minecraft:purple_dye run scoreboard players add lockdown.channel lockdown.local 10
execute if items block ~ ~ ~ container.8 minecraft:blue_dye run scoreboard players add lockdown.channel lockdown.local 11
execute if items block ~ ~ ~ container.8 minecraft:brown_dye run scoreboard players add lockdown.channel lockdown.local 12
execute if items block ~ ~ ~ container.8 minecraft:green_dye run scoreboard players add lockdown.channel lockdown.local 13
execute if items block ~ ~ ~ container.8 minecraft:red_dye run scoreboard players add lockdown.channel lockdown.local 14
execute if items block ~ ~ ~ container.8 minecraft:black_dye run scoreboard players add lockdown.channel lockdown.local 15

execute if items block ~ ~ ~ container.7 minecraft:white_dye run scoreboard players add lockdown.channel lockdown.local 0
execute if items block ~ ~ ~ container.7 minecraft:orange_dye run scoreboard players add lockdown.channel lockdown.local 16
execute if items block ~ ~ ~ container.7 minecraft:magenta_dye run scoreboard players add lockdown.channel lockdown.local 32
execute if items block ~ ~ ~ container.7 minecraft:light_blue_dye run scoreboard players add lockdown.channel lockdown.local 48
execute if items block ~ ~ ~ container.7 minecraft:yellow_dye run scoreboard players add lockdown.channel lockdown.local 64
execute if items block ~ ~ ~ container.7 minecraft:lime_dye run scoreboard players add lockdown.channel lockdown.local 80
execute if items block ~ ~ ~ container.7 minecraft:pink_dye run scoreboard players add lockdown.channel lockdown.local 96
execute if items block ~ ~ ~ container.7 minecraft:gray_dye run scoreboard players add lockdown.channel lockdown.local 112
execute if items block ~ ~ ~ container.7 minecraft:light_gray_dye run scoreboard players add lockdown.channel lockdown.local 128
execute if items block ~ ~ ~ container.7 minecraft:cyan_dye run scoreboard players add lockdown.channel lockdown.local 144
execute if items block ~ ~ ~ container.7 minecraft:purple_dye run scoreboard players add lockdown.channel lockdown.local 160
execute if items block ~ ~ ~ container.7 minecraft:blue_dye run scoreboard players add lockdown.channel lockdown.local 176
execute if items block ~ ~ ~ container.7 minecraft:brown_dye run scoreboard players add lockdown.channel lockdown.local 192
execute if items block ~ ~ ~ container.7 minecraft:green_dye run scoreboard players add lockdown.channel lockdown.local 208
execute if items block ~ ~ ~ container.7 minecraft:red_dye run scoreboard players add lockdown.channel lockdown.local 224
execute if items block ~ ~ ~ container.7 minecraft:black_dye run scoreboard players add lockdown.channel lockdown.local 240

execute if items block ~ ~ ~ container.6 minecraft:white_dye run scoreboard players add lockdown.channel lockdown.local 0
execute if items block ~ ~ ~ container.6 minecraft:orange_dye run scoreboard players add lockdown.channel lockdown.local 256
execute if items block ~ ~ ~ container.6 minecraft:magenta_dye run scoreboard players add lockdown.channel lockdown.local 512
execute if items block ~ ~ ~ container.6 minecraft:light_blue_dye run scoreboard players add lockdown.channel lockdown.local 768
execute if items block ~ ~ ~ container.6 minecraft:yellow_dye run scoreboard players add lockdown.channel lockdown.local 1024
execute if items block ~ ~ ~ container.6 minecraft:lime_dye run scoreboard players add lockdown.channel lockdown.local 1280
execute if items block ~ ~ ~ container.6 minecraft:pink_dye run scoreboard players add lockdown.channel lockdown.local 1536
execute if items block ~ ~ ~ container.6 minecraft:gray_dye run scoreboard players add lockdown.channel lockdown.local 1792
execute if items block ~ ~ ~ container.6 minecraft:light_gray_dye run scoreboard players add lockdown.channel lockdown.local 2048
execute if items block ~ ~ ~ container.6 minecraft:cyan_dye run scoreboard players add lockdown.channel lockdown.local 2304
execute if items block ~ ~ ~ container.6 minecraft:purple_dye run scoreboard players add lockdown.channel lockdown.local 2560
execute if items block ~ ~ ~ container.6 minecraft:blue_dye run scoreboard players add lockdown.channel lockdown.local 2816
execute if items block ~ ~ ~ container.6 minecraft:brown_dye run scoreboard players add lockdown.channel lockdown.local 3072
execute if items block ~ ~ ~ container.6 minecraft:green_dye run scoreboard players add lockdown.channel lockdown.local 3328
execute if items block ~ ~ ~ container.6 minecraft:red_dye run scoreboard players add lockdown.channel lockdown.local 3584
execute if items block ~ ~ ~ container.6 minecraft:black_dye run scoreboard players add lockdown.channel lockdown.local 3840

return run scoreboard players get lockdown.channel lockdown.local
