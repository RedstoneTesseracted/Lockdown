# This function is intended for custom blocks that are actually birch buttons when placed.  Run by and at the armor stand.

# Orient the armor stand
execute if block ~ ~ ~ birch_button[facing=north,face=floor] run data merge entity @s {Pose:{Head:[0.0f,0.0f,0.0f]}}
execute if block ~ ~ ~ birch_button[facing=north,face=wall] run data merge entity @s {Pose:{Head:[90.0f,180.0f,0.0f]}}
execute if block ~ ~ ~ birch_button[facing=north,face=ceiling] run data merge entity @s {Pose:{Head:[180.0f,0.0f,0.0f]}}

execute if block ~ ~ ~ birch_button[facing=south,face=floor] run data merge entity @s {Pose:{Head:[0.0f,180.0f,0.0f]}}
execute if block ~ ~ ~ birch_button[facing=south,face=wall] run data merge entity @s {Pose:{Head:[90.0f,0.0f,0.0f]}}
execute if block ~ ~ ~ birch_button[facing=south,face=ceiling] run data merge entity @s {Pose:{Head:[180.0f,180.0f,0.0f]}}

execute if block ~ ~ ~ birch_button[facing=east,face=floor] run data merge entity @s {Pose:{Head:[0.0f,90.0f,0.0f]}}
execute if block ~ ~ ~ birch_button[facing=east,face=wall] run data merge entity @s {Pose:{Head:[90.0f,270.0f,0.0f]}}
execute if block ~ ~ ~ birch_button[facing=east,face=ceiling] run data merge entity @s {Pose:{Head:[180.0f,90.0f,0.0f]}}

execute if block ~ ~ ~ birch_button[facing=west,face=floor] run data merge entity @s {Pose:{Head:[0.0f,270.0f,0.0f]}}
execute if block ~ ~ ~ birch_button[facing=west,face=wall] run data merge entity @s {Pose:{Head:[90.0f,90.0f,0.0f]}}
execute if block ~ ~ ~ birch_button[facing=west,face=ceiling] run data merge entity @s {Pose:{Head:[180.0f,270.0f,0.0f]}}

# Replace the birch button with an acacia button
execute if block ~ ~ ~ birch_button[facing=north,face=floor] run setblock ~ ~ ~ minecraft:acacia_button[facing=north,face=floor]
execute if block ~ ~ ~ birch_button[facing=north,face=wall] run setblock ~ ~ ~ minecraft:acacia_button[facing=north,face=wall]
execute if block ~ ~ ~ birch_button[facing=north,face=ceiling] run setblock ~ ~ ~ minecraft:acacia_button[facing=north,face=ceiling]

execute if block ~ ~ ~ birch_button[facing=south,face=floor] run setblock ~ ~ ~ minecraft:acacia_button[facing=south,face=floor]
execute if block ~ ~ ~ birch_button[facing=south,face=wall] run setblock ~ ~ ~ minecraft:acacia_button[facing=south,face=wall]
execute if block ~ ~ ~ birch_button[facing=south,face=ceiling] run setblock ~ ~ ~ minecraft:acacia_button[facing=south,face=ceiling]

execute if block ~ ~ ~ birch_button[facing=east,face=floor] run setblock ~ ~ ~ minecraft:acacia_button[facing=east,face=floor]
execute if block ~ ~ ~ birch_button[facing=east,face=wall] run setblock ~ ~ ~ minecraft:acacia_button[facing=east,face=wall]
execute if block ~ ~ ~ birch_button[facing=east,face=ceiling] run setblock ~ ~ ~ minecraft:acacia_button[facing=east,face=ceiling]

execute if block ~ ~ ~ birch_button[facing=west,face=floor] run setblock ~ ~ ~ minecraft:acacia_button[facing=west,face=floor]
execute if block ~ ~ ~ birch_button[facing=west,face=wall] run setblock ~ ~ ~ minecraft:acacia_button[facing=west,face=wall]
execute if block ~ ~ ~ birch_button[facing=west,face=ceiling] run setblock ~ ~ ~ minecraft:acacia_button[facing=west,face=ceiling]

# Destroy the block if its channel is 0 (indicating that it was not encoded when it should have been)
execute if score @s ld_channel matches 0 run tellraw @a[distance=..7] ["",{"text":"This block must be assigned a channel in the ","color":"red"},{"text":"encoder","color":"gold"},{"text":" to work!","color":"red"}]]
execute if score @s ld_channel matches 0 run setblock ~ ~ ~ air destroy
