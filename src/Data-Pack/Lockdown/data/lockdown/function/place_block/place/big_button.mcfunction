# Place the big button block at current position
##### BEGIN INFO BLOCK #####
# > WARNING: This block is used by generate_templates.py to fill in certain details
# > when automatically generating the device placer unit tests.  Change it with caution!
# Solid: true
# Block: minecraft:acacia_button
# Entity: item_frame
# Directions 6
# Channels: true
# Colors: true
# Extra Parts:
# Placement Rules: nonsolid_entity_placement
###### END INFO BLOCK ######

# Prevent overlap with an existing entity
execute align xyz if entity @e[dx=0.1, dy=0.1, dz=0.1,type=#lockdown:blocks_nonsolid_placement,tag=!lockdown.placer] run return run function lockdown:place_block/reject/big_button {msg: "lockdown.placer.reject.not_enough_space"}

# Play effects
playsound minecraft:block.stone.place block @a ~ ~ ~ 1.0 1.0

# Summon the base entity
# We infer the big_button direction using the item frame's "Facing" property
# Facing:
#   0 - up (+Y)
#   1 - down (-Y)
#   2 - north (-Z)
#   3 - south (+Z)
#   4 - west (-X)
#   5 - East (+X)
scoreboard players set lockdown.direction lockdown.local 0
execute store result score lockdown.direction lockdown.local run data get entity @s Facing

execute if score lockdown.direction lockdown.local matches 0 align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {transformation: {translation: [0.0f, 0.0f, 0.0f], left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f], right_rotation: [0.0f, 0.0f, 1.0f, 0.0f]}, Tags:["lockdown.block","lockdown.block.display","lockdown.block.display.new","lockdown.block.root","lockdown.block.root.new","lockdown.big_button"],item:{id: "minecraft:paper",count:1b,components:{"minecraft:item_model":"lockdown:button/button","minecraft:custom_model_data":{strings:["red"],flags:[false]}}}}
execute if score lockdown.direction lockdown.local matches 1 align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {transformation: {translation: [0.0f, 0.0f, 0.0f], left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f]}, Tags:["lockdown.block","lockdown.block.display","lockdown.block.display.new","lockdown.block.root","lockdown.block.root.new","lockdown.big_button"],item:{id: "minecraft:paper",count:1b,components:{"minecraft:item_model":"lockdown:button/button","minecraft:custom_model_data":{strings:["red"],flags:[false]}}}}
execute if score lockdown.direction lockdown.local matches 2 align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {transformation: {translation: [0.0f, 0.0f, 0.0f], left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f], right_rotation: [0.0f, -1.0f, 1.0f, 0.0f]}, Tags:["lockdown.block","lockdown.block.display","lockdown.block.display.new","lockdown.block.root","lockdown.block.root.new","lockdown.big_button"],item:{id: "minecraft:paper",count:1b,components:{"minecraft:item_model":"lockdown:button/button","minecraft:custom_model_data":{strings:["red"],flags:[false]}}}}
execute if score lockdown.direction lockdown.local matches 3 align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {transformation: {translation: [0.0f, 0.0f, 0.0f], left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f], right_rotation: [0.0f, 1.0f, 1.0f, 0.0f]}, Tags:["lockdown.block","lockdown.block.display","lockdown.block.display.new","lockdown.block.root","lockdown.block.root.new","lockdown.big_button"],item:{id: "minecraft:paper",count:1b,components:{"minecraft:item_model":"lockdown:button/button","minecraft:custom_model_data":{strings:["red"],flags:[false]}}}}
execute if score lockdown.direction lockdown.local matches 4 align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {transformation: {translation: [0.0f, 0.0f, 0.0f], left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f], right_rotation: [1.0f, -1.0f, 0.0f, 0.0f]}, Tags:["lockdown.block","lockdown.block.display","lockdown.block.display.new","lockdown.block.root","lockdown.block.root.new","lockdown.big_button"],item:{id: "minecraft:paper",count:1b,components:{"minecraft:item_model":"lockdown:button/button","minecraft:custom_model_data":{strings:["red"],flags:[false]}}}}
execute if score lockdown.direction lockdown.local matches 5 align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {transformation: {translation: [0.0f, 0.0f, 0.0f], left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f], right_rotation: [1.0f, 1.0f, 0.0f, 0.0f]}, Tags:["lockdown.block","lockdown.block.display","lockdown.block.display.new","lockdown.block.root","lockdown.block.root.new","lockdown.big_button"],item:{id: "minecraft:paper",count:1b,components:{"minecraft:item_model":"lockdown:button/button","minecraft:custom_model_data":{strings:["red"],flags:[false]}}}}

# Set button color info
function lockdown:place_block/place/colored_common

# Place block based on direction
execute if score lockdown.direction lockdown.local matches 0 run setblock ~ ~ ~ minecraft:acacia_button[face=ceiling,powered=false] destroy
execute if score lockdown.direction lockdown.local matches 1 run setblock ~ ~ ~ minecraft:acacia_button[face=floor,powered=false] destroy
execute if score lockdown.direction lockdown.local matches 2 run setblock ~ ~ ~ minecraft:acacia_button[face=wall,powered=false,facing=north] destroy
execute if score lockdown.direction lockdown.local matches 3 run setblock ~ ~ ~ minecraft:acacia_button[face=wall,powered=false,facing=south] destroy
execute if score lockdown.direction lockdown.local matches 4 run setblock ~ ~ ~ minecraft:acacia_button[face=wall,powered=false,facing=west] destroy
execute if score lockdown.direction lockdown.local matches 5 run setblock ~ ~ ~ minecraft:acacia_button[face=wall,powered=false,facing=east] destroy

# This item may optionally have a channel assigned
execute store result score @n[tag=lockdown.block.root.new] lockdown.channel run data get entity @s Item.components."minecraft:custom_data".lockdown_data.channel
