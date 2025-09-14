# Place the alarm block at current position
##### BEGIN INFO BLOCK #####
# > WARNING: This block is used by generate_templates.py to fill in certain details
# > when automatically generating the device placer unit tests.  Change it with caution!
# Solid: false
# Entity: item_frame
# Directions 6
# Channels: true
# Colors: true
# Extra Parts: lockdown.alarm.glow
# Placement Rules: requires_channel, nonsolid_entity_placement
# Destruction Rule: interaction_attack
###### END INFO BLOCK ######

# * Directional (check item frame for direction)
# * Not solid

# Needed for the channel-to-item assignment code in lockdown:place_block/reject/alarm
execute store result score lockdown.channel lockdown.local run data get entity @s Item.components."minecraft:custom_data".lockdown_data.channel

# Prevent overlap with an existing entity
execute align xyz if entity @e[dx=0.1, dy=0.1, dz=0.1,type=#lockdown:blocks_nonsolid_placement,tag=!lockdown.placer] run return run function lockdown:place_block/reject/alarm {msg: "lockdown.placer.reject.not_enough_space"}

# Requires channel
execute unless score lockdown.channel lockdown.local matches 1.. run return run function lockdown:place_block/reject/alarm {msg: "lockdown.placer.reject.no_channel"}

# Play effects
playsound minecraft:block.stone.place block @a ~ ~ ~ 1.0 1.0

# Summon the base interaction entity
# We infer the alarm direction using the item frame's "Facing" property
# Facing:
#   0 - up (+Y)
#   1 - down (-Y)
#   2 - north (-Z)
#   3 - south (+Z)
#   4 - west (-X)
#   5 - East (+X)
scoreboard players set lockdown.direction lockdown.local 0
execute store result score lockdown.direction lockdown.local run data get entity @s Facing

execute if score lockdown.direction lockdown.local matches 0 align xyz positioned ~0.5 ~0.5 ~0.5 positioned ~ ~-0.3125 ~ positioned ~ ~-0.001 ~ run summon minecraft:interaction ~ ~0.1875 ~ {Tags:["lockdown.alarm", "lockdown.block", "lockdown.block.root", "lockdown.block.root.new", "lockdown.block.hitbox", "lockdown.block.hitbox.new"], height: 0.625, width: 0.625, response: 1b}
execute if score lockdown.direction lockdown.local matches 1 align xyz positioned ~0.5 ~0.5 ~0.5 positioned ~ ~-0.3125 ~ positioned ~ ~0.001 ~ run summon minecraft:interaction ~ ~-0.1875 ~ {Tags:["lockdown.alarm", "lockdown.block", "lockdown.block.root", "lockdown.block.root.new", "lockdown.block.hitbox", "lockdown.block.hitbox.new"], height: 0.625, width: 0.625, response: 1b}
execute if score lockdown.direction lockdown.local matches 2 align xyz positioned ~0.5 ~0.5 ~0.5 positioned ~ ~-0.3125 ~ positioned ~ ~ ~-0.001 run summon minecraft:interaction ~ ~ ~0.1875 {Tags:["lockdown.alarm", "lockdown.block", "lockdown.block.root", "lockdown.block.root.new", "lockdown.block.hitbox", "lockdown.block.hitbox.new"], height: 0.625, width: 0.625, response: 1b}
execute if score lockdown.direction lockdown.local matches 3 align xyz positioned ~0.5 ~0.5 ~0.5 positioned ~ ~-0.3125 ~ positioned ~ ~ ~0.001 run summon minecraft:interaction ~ ~ ~-0.1875 {Tags:["lockdown.alarm", "lockdown.block", "lockdown.block.root", "lockdown.block.root.new", "lockdown.block.hitbox", "lockdown.block.hitbox.new"], height: 0.625, width: 0.625, response: 1b}
execute if score lockdown.direction lockdown.local matches 4 align xyz positioned ~0.5 ~0.5 ~0.5 positioned ~ ~-0.3125 ~ positioned ~-0.001 ~ ~ run summon minecraft:interaction ~0.1875 ~ ~ {Tags:["lockdown.alarm", "lockdown.block", "lockdown.block.root", "lockdown.block.root.new", "lockdown.block.hitbox", "lockdown.block.hitbox.new"], height: 0.625, width: 0.625, response: 1b}
execute if score lockdown.direction lockdown.local matches 5 align xyz positioned ~0.5 ~0.5 ~0.5 positioned ~ ~-0.3125 ~ positioned ~0.001 ~ ~ run summon minecraft:interaction ~-0.1875 ~ ~ {Tags:["lockdown.alarm", "lockdown.block", "lockdown.block.root", "lockdown.block.root.new", "lockdown.block.hitbox", "lockdown.block.hitbox.new"], height: 0.625, width: 0.625, response: 1b}

# Behavior tags
tag @n[tag=lockdown.block.root.new] add lockdown.channel.receiver
tag @n[tag=lockdown.block.root.new] add lockdown.behavior.attack_to_destroy

# Common wall-mounting stuff
execute as @n[tag=lockdown.block.root.new] run function lockdown:place_block/place/common_wall_mounted

# Summon and mount item display used to show block
execute at @n[tag=lockdown.block.root.new] positioned ~ ~0.625 ~ run summon minecraft:item_display ~ ~ ~ {transformation:[1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f], Tags:["lockdown.alarm", "lockdown.block", "lockdown.block.display", "lockdown.block.display.new"],item:{"id": "minecraft:paper",count:1b,components:{"minecraft:item_model": "lockdown:alarm/alarm_light", "minecraft:custom_model_data": {strings:["red"],flags:[false]}}}}
ride @n[tag=lockdown.block.display.new] mount @n[tag=lockdown.block.root.new]

execute if score lockdown.direction lockdown.local matches 0 run data merge entity @e[tag=lockdown.alarm,tag=lockdown.block.display.new,limit=1] {transformation: {translation: [0.0f, -0.5f, 0.0f], right_rotation: [0.0f, 0.0f, 1.0f, 0.0f]}}
execute if score lockdown.direction lockdown.local matches 1 run data merge entity @e[tag=lockdown.alarm,tag=lockdown.block.display.new,limit=1] {transformation: {translation: [0.0f, -0.125f, 0.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f]}}
execute if score lockdown.direction lockdown.local matches 2 run data merge entity @e[tag=lockdown.alarm,tag=lockdown.block.display.new,limit=1] {transformation: {translation: [0.0f, -0.3125f, -0.1875f], right_rotation: [0.0f, -1.0f, 1.0f, 0.0f]}}
execute if score lockdown.direction lockdown.local matches 3 run data merge entity @e[tag=lockdown.alarm,tag=lockdown.block.display.new,limit=1] {transformation: {translation: [0.0f, -0.3125f, 0.1875f], right_rotation: [0.0f, 1.0f, 1.0f, 0.0f]}}
execute if score lockdown.direction lockdown.local matches 4 run data merge entity @e[tag=lockdown.alarm,tag=lockdown.block.display.new,limit=1] {transformation: {translation: [-0.1875f, -0.3125f, 0.0f], right_rotation: [1.0f, -1.0f, 0.0f, 0.0f]}}
execute if score lockdown.direction lockdown.local matches 5 run data merge entity @e[tag=lockdown.alarm,tag=lockdown.block.display.new,limit=1] {transformation: {translation: [0.1875f, -0.3125f, 0.0f], right_rotation: [1.0f, 1.0f, 0.0f, 0.0f]}}

# Scoreboard properties
scoreboard players set @n[tag=lockdown.block.display.new] lockdown.rotation 0

# Set button color info
function lockdown:place_block/place/colored_common

# Summon and mount item display used to show glow effect
execute at @n[tag=lockdown.block.root.new] positioned ~ ~0.625 ~ run summon minecraft:item_display ~ ~ ~ {interpolation_duration: 1, brightness: {block: 15, sky: 15}, Tags:["lockdown.alarm", "lockdown.block", "lockdown.alarm.glow", "lockdown.alarm.glow.new"],item:{"id": "minecraft:paper",count:1b,components:{"minecraft:item_model": "lockdown:glow", "minecraft:custom_model_data": {strings:["red"],flags:[false]}}}}
ride @n[tag=lockdown.alarm.glow.new] mount @n[tag=lockdown.block.root.new]
execute if score lockdown.direction lockdown.local matches 0 run data merge entity @e[tag=lockdown.alarm.glow.new,limit=1] {transformation: {translation: [0.0f, -0.5f, 0.0f], right_rotation: [0.0f, 0.0f, 1.0f, 0.0f]}}
execute if score lockdown.direction lockdown.local matches 1 run data merge entity @e[tag=lockdown.alarm.glow.new,limit=1] {transformation: {translation: [0.0f, -0.125f, 0.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f]}}
execute if score lockdown.direction lockdown.local matches 2 run data merge entity @e[tag=lockdown.alarm.glow.new,limit=1] {transformation: {translation: [0.0f, -0.3125f, -0.1875f], right_rotation: [0.0f, -1.0f, 1.0f, 0.0f]}}
execute if score lockdown.direction lockdown.local matches 3 run data merge entity @e[tag=lockdown.alarm.glow.new,limit=1] {transformation: {translation: [0.0f, -0.3125f, 0.1875f], right_rotation: [0.0f, 1.0f, 1.0f, 0.0f]}}
execute if score lockdown.direction lockdown.local matches 4 run data merge entity @e[tag=lockdown.alarm.glow.new,limit=1] {transformation: {translation: [-0.1875f, -0.3125f, 0.0f], right_rotation: [1.0f, -1.0f, 0.0f, 0.0f]}}
execute if score lockdown.direction lockdown.local matches 5 run data merge entity @e[tag=lockdown.alarm.glow.new,limit=1] {transformation: {translation: [0.1875f, -0.3125f, 0.0f], right_rotation: [1.0f, 1.0f, 0.0f, 0.0f]}}
data modify entity @n[tag=lockdown.alarm.glow.new] item.components."minecraft:custom_model_data".strings set from entity @n[tag=lockdown.block.display.new] item.components."minecraft:custom_model_data".strings

# Assign channel
scoreboard players operation @n[tag=lockdown.block.root.new] lockdown.channel = lockdown.channel lockdown.local
execute as @n[tag=lockdown.block.root.new] run function lockdown:channels/update
