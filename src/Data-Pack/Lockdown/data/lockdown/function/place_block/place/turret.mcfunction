# Place a turret at current position
# * Directional (check item frame for direction)
# * Not solid
# * Very special

# Prevent overlap with an existing entity
execute align xyz if entity @e[dx=0.1, dy=0.1, dz=0.1,type=#lockdown:placement_blocking,tag=!lockdown.placer] run return run function lockdown:place_block/reject/alarm {msg: "lockdown.placer.reject.not_enough_space"}

# Play effects
playsound minecraft:block.metal.place block @a ~ ~ ~ 1.0 1.0

# We infer the turret direction using the item frame's "Facing" property
# Facing:
#   0 - up (+Y)
#   1 - down (-Y)
#   2 - north (-Z)
#   3 - south (+Z)
#   4 - west (-X)
#   5 - East (+X)
scoreboard players set lockdown.direction lockdown.local 0
execute store result score lockdown.direction lockdown.local run data get entity @s Facing

# Summon the base entity
# We shift the base to account for the bee's hitbox
# Bee standard hitbox: height=0.6, width=0.7
execute if score lockdown.direction lockdown.local matches 0 align xyz positioned ~ ~-0.1 ~ run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {transformation: {translation: [0.0f, 0.1f, 0.0f], left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f], right_rotation: [0.0f, 0.0f, 1.0f, 0.0f]}, Tags:["lockdown.direction.up","lockdown.block","lockdown.block.display","lockdown.block.display.new","lockdown.turret.base","lockdown.block.root","lockdown.block.root.new","lockdown.turret"],item:{id: "minecraft:paper",count:1b,components:{"minecraft:item_model":"lockdown:invisible"}}}
execute if score lockdown.direction lockdown.local matches 1 align xyz positioned ~ ~-0.5 ~ run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {transformation: {translation: [0.0f, 0.5f, 0.0f], left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f]}, Tags:["lockdown.direction.down","lockdown.block","lockdown.block.display","lockdown.block.display.new","lockdown.turret.base","lockdown.block.root","lockdown.block.root.new","lockdown.turret"],item:{id: "minecraft:paper",count:1b,components:{"minecraft:item_model":"lockdown:invisible"}}}
execute if score lockdown.direction lockdown.local matches 2 align xyz positioned ~ ~-0.3 ~0.15 run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {transformation: {translation: [0.0f, 0.3f, -0.15f], left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f], right_rotation: [0.0f, -1.0f, 1.0f, 0.0f]}, Tags:["lockdown.direction.north","lockdown.block","lockdown.block.display","lockdown.block.display.new","lockdown.turret.base","lockdown.block.root","lockdown.block.root.new","lockdown.turret"],item:{id: "minecraft:paper",count:1b,components:{"minecraft:item_model":"lockdown:invisible"}}}
execute if score lockdown.direction lockdown.local matches 3 align xyz positioned ~ ~-0.3 ~-0.15 run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {transformation: {translation: [0.0f, 0.3f, 0.15f], left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f], right_rotation: [0.0f, 1.0f, 1.0f, 0.0f]}, Tags:["lockdown.direction.south","lockdown.block","lockdown.block.display","lockdown.block.display.new","lockdown.turret.base","lockdown.block.root","lockdown.block.root.new","lockdown.turret"],item:{id: "minecraft:paper",count:1b,components:{"minecraft:item_model":"lockdown:invisible"}}}
execute if score lockdown.direction lockdown.local matches 4 align xyz positioned ~0.15 ~-0.3 ~ run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {transformation: {translation: [-0.15f, 0.3f, 0.0f], left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f], right_rotation: [1.0f, -1.0f, 0.0f, 0.0f]}, Tags:["lockdown.direction.west","lockdown.block","lockdown.block.display","lockdown.block.display.new","lockdown.turret.base","lockdown.block.root","lockdown.block.root.new","lockdown.turret"],item:{id: "minecraft:paper",count:1b,components:{"minecraft:item_model":"lockdown:invisible"}}}
execute if score lockdown.direction lockdown.local matches 5 align xyz positioned ~-0.15 ~-0.3 ~ run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {transformation: {translation: [0.15f, 0.3f, 0.0f], left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f], right_rotation: [1.0f, 1.0f, 0.0f, 0.0f]}, Tags:["lockdown.direction.east","lockdown.block","lockdown.block.display","lockdown.block.display.new","lockdown.turret.base","lockdown.block.root","lockdown.block.root.new","lockdown.turret"],item:{id: "minecraft:paper",count:1b,components:{"minecraft:item_model":"lockdown:invisible"}}}


# Summon and mount the item displays
#   1. Base (turret base entity)
#   2. Turret mount
#   3. Turret barrel
execute align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {interpolation_duration: 2, transformation: {translation: [0.0f, 0.0f, 0.0f], left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f]}, Tags:["lockdown.block","lockdown.block.display","lockdown.block.display.new","lockdown.turret.gantry","lockdown.turret"],item:{id: "minecraft:paper",count:1b,components:{"minecraft:item_model":"lockdown:invisible"}}}
execute align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {interpolation_duration: 2, transformation: {translation: [0.0f, 0.0f, 0.0f], left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f]}, Tags:["lockdown.block","lockdown.block.display","lockdown.block.display.new","lockdown.turret.barrel","lockdown.turret"],item:{id: "minecraft:paper",count:1b,components:{"minecraft:item_model":"lockdown:invisible","minecraft:custom_model_data":{strings:["unset"]}}}}
ride @n[tag=lockdown.block.display.new,tag=lockdown.turret.gantry] mount @n[tag=lockdown.block.root.new]
ride @n[tag=lockdown.block.display.new,tag=lockdown.turret.barrel] mount @n[tag=lockdown.block.root.new]

# Shift display entities according to direction
# Bee standard hitbox: height=0.6, width=0.7
execute if score lockdown.direction lockdown.local matches 0 as @e[tag=lockdown.block.display.new] run data modify entity @s transformation.translation set value [0.0f, 0.1f, 0.0f]
execute if score lockdown.direction lockdown.local matches 1 as @e[tag=lockdown.block.display.new] run data modify entity @s transformation.translation set value [0.0f, 0.5f, 0.0f]
execute if score lockdown.direction lockdown.local matches 2 as @e[tag=lockdown.block.display.new] run data modify entity @s transformation.translation set value [0.0f, 0.3f, -0.15f]
execute if score lockdown.direction lockdown.local matches 3 as @e[tag=lockdown.block.display.new] run data modify entity @s transformation.translation set value [0.0f, 0.3f, 0.15f]
execute if score lockdown.direction lockdown.local matches 4 as @e[tag=lockdown.block.display.new] run data modify entity @s transformation.translation set value [-0.15f, 0.3f, 0.0f]
execute if score lockdown.direction lockdown.local matches 5 as @e[tag=lockdown.block.display.new] run data modify entity @s transformation.translation set value [0.15f, 0.3f, 0.0f]

# Set item display direction
execute if score lockdown.direction lockdown.local matches 0 as @e[tag=lockdown.block.display.new,tag=!lockdown.turret.barrel] run data modify entity @s transformation.right_rotation set value {angle:  3.141592653589793f, axis: [0.0f, 0.0f, 1.0f]}
execute if score lockdown.direction lockdown.local matches 1 as @e[tag=lockdown.block.display.new,tag=!lockdown.turret.barrel] run data modify entity @s transformation.right_rotation set value {angle:  0.000000000000000f, axis: [0.0f, 0.0f, 1.0f]}
execute if score lockdown.direction lockdown.local matches 2 as @e[tag=lockdown.block.display.new,tag=!lockdown.turret.barrel] run data modify entity @s transformation.right_rotation set value {angle: -1.5707963267948966f, axis: [1.0f, 0.0f, 0.0f]}
execute if score lockdown.direction lockdown.local matches 3 as @e[tag=lockdown.block.display.new,tag=!lockdown.turret.barrel] run data modify entity @s transformation.right_rotation set value {angle:  1.5707963267948966f, axis: [1.0f, 0.0f, 0.0f]}
execute if score lockdown.direction lockdown.local matches 4 as @e[tag=lockdown.block.display.new,tag=!lockdown.turret.barrel] run data modify entity @s transformation.right_rotation set value {angle:  1.5707963267948966f, axis: [0.0f, 0.0f, 1.0f]}
execute if score lockdown.direction lockdown.local matches 5 as @e[tag=lockdown.block.display.new,tag=!lockdown.turret.barrel] run data modify entity @s transformation.right_rotation set value {angle: -1.5707963267948966f, axis: [0.0f, 0.0f, 1.0f]}

# Set models
data modify entity @n[tag=lockdown.block.display.new,tag=lockdown.turret.base] item.components."minecraft:item_model" set value "lockdown:turret/base"
data modify entity @n[tag=lockdown.block.display.new,tag=lockdown.turret.gantry] item.components."minecraft:item_model" set value "lockdown:turret/gantry"
data modify entity @n[tag=lockdown.block.display.new,tag=lockdown.turret.barrel] item.components."minecraft:item_model" set value "lockdown:turret/barrel"

execute if score lockdown.direction lockdown.local matches 0 as @e[tag=lockdown.block.display.new,tag=lockdown.turret.barrel] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "up"
execute if score lockdown.direction lockdown.local matches 1 as @e[tag=lockdown.block.display.new,tag=lockdown.turret.barrel] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "down"
execute if score lockdown.direction lockdown.local matches 2 as @e[tag=lockdown.block.display.new,tag=lockdown.turret.barrel] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "north"
execute if score lockdown.direction lockdown.local matches 3 as @e[tag=lockdown.block.display.new,tag=lockdown.turret.barrel] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "south"
execute if score lockdown.direction lockdown.local matches 4 as @e[tag=lockdown.block.display.new,tag=lockdown.turret.barrel] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "west"
execute if score lockdown.direction lockdown.local matches 5 as @e[tag=lockdown.block.display.new,tag=lockdown.turret.barrel] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "east"


# Summon the damage box entity
execute align xyz run summon minecraft:bee ~0.5 ~0.5 ~0.5 {NoAI:1b, NoGravity:1b, active_effects:[{id:"minecraft:invisibility", duration: 1000000, amplifier: 1, show_particles: 0b}], Tags: ["lockdown.block", "lockdown.turret", "lockdown.block.hitbox", "lockdown.block.hitbox.new"], Silent: 1b}
ride @n[tag=lockdown.block.hitbox.new] mount @n[tag=lockdown.block.root.new]

# Summon the interaction entity
execute align xyz run summon minecraft:interaction ~0.5 ~0.5 ~0.5 {width: 0.0f, height: 0.0f, response: 1b,Tags:["lockdown.block", "lockdown.turret", "lockdown.block.interaction", "lockdown.block.interaction.new"]}
ride @n[tag=lockdown.block.interaction.new] mount @n[tag=lockdown.block.root.new]
