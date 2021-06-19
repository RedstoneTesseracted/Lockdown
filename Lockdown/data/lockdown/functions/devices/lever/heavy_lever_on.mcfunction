execute store result entity @s ArmorItems[3].tag.CustomModelData int 1 run data get entity @s ArmorItems[3].tag.LockdownData.function_model
tag @s add ld_on
stopsound @a[distance=..10] block minecraft:block.wooden_button.click_on
# Halt the block update
execute if block ~ ~ ~ minecraft:acacia_button[facing=north,face=ceiling] run setblock ~ ~ ~ minecraft:acacia_button[facing=north,face=ceiling,powered=false]
execute if block ~ ~ ~ minecraft:acacia_button[facing=north,face=wall] run setblock ~ ~ ~ minecraft:acacia_button[facing=north,face=wall,powered=false]
execute if block ~ ~ ~ minecraft:acacia_button[facing=north,face=floor] run setblock ~ ~ ~ minecraft:acacia_button[facing=north,face=floor,powered=false]

execute if block ~ ~ ~ minecraft:acacia_button[facing=south,face=ceiling] run setblock ~ ~ ~ minecraft:acacia_button[facing=south,face=ceiling,powered=false]
execute if block ~ ~ ~ minecraft:acacia_button[facing=south,face=wall] run setblock ~ ~ ~ minecraft:acacia_button[facing=south,face=wall,powered=false]
execute if block ~ ~ ~ minecraft:acacia_button[facing=south,face=floor] run setblock ~ ~ ~ minecraft:acacia_button[facing=south,face=floor,powered=false]

execute if block ~ ~ ~ minecraft:acacia_button[facing=east,face=ceiling] run setblock ~ ~ ~ minecraft:acacia_button[facing=east,face=ceiling,powered=false]
execute if block ~ ~ ~ minecraft:acacia_button[facing=east,face=wall] run setblock ~ ~ ~ minecraft:acacia_button[facing=east,face=wall,powered=false]
execute if block ~ ~ ~ minecraft:acacia_button[facing=east,face=floor] run setblock ~ ~ ~ minecraft:acacia_button[facing=east,face=floor,powered=false]

execute if block ~ ~ ~ minecraft:acacia_button[facing=west,face=ceiling] run setblock ~ ~ ~ minecraft:acacia_button[facing=west,face=ceiling,powered=false]
execute if block ~ ~ ~ minecraft:acacia_button[facing=west,face=wall] run setblock ~ ~ ~ minecraft:acacia_button[facing=west,face=wall,powered=false]
execute if block ~ ~ ~ minecraft:acacia_button[facing=west,face=floor] run setblock ~ ~ ~ minecraft:acacia_button[facing=west,face=floor,powered=false]
playsound minecraft:block.iron_trapdoor.open block @a ~ ~ ~ 1 0.0
