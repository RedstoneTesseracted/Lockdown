# Place a force field projector block at current position
##### BEGIN INFO BLOCK #####
# > WARNING: This block is used by generate_templates.py to fill in certain details
# > when automatically generating the device placer unit tests.  Change it with caution!
# Solid: true
# Block: minecraft:note_block
# Entity: item_frame
# Directions: 12
# Channels: false
# Colors: false
# Extra Parts: lockdown.force_field_projector.shield
# Placement Rules: solid_block_placement
# Destruction Rule: block_break
###### END INFO BLOCK ######

# This prevents the channel-to-item assignment code in lockdown:place_block/reject/generic from running
scoreboard players set lockdown.channel lockdown.local 0

# Requires enough room
execute unless block ~ ~ ~ #minecraft:replaceable run return run function lockdown:place_block/reject/generic {msg: "lockdown.placer.reject.not_enough_space", dropper: "lockdown:drop/force_field_projector"}
execute align xyz if entity @e[dx=0.1, dy=0.1, dz=0.1,type=!#lockdown:strict_placement_nonblocking,tag=!lockdown.placer] run return run function lockdown:place_block/reject/generic {msg: "lockdown.placer.reject.not_enough_space", dropper: "lockdown:drop/force_field_projector"}

# Play effects
playsound minecraft:block.stone.place block @a ~ ~ ~ 1.0 1.0

# Set base block
setblock ~ ~ ~ minecraft:note_block destroy

# Summon display entity
#execute align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {brightness:{block: 15, sky: 15}, transformation:[1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f], Tags:["lockdown.block", "lockdown.force_field_projector", "lockdown.block.root", "lockdown.block.display", "lockdown.block.root.new", "lockdown.block.display.new"],item:{id:"minecraft:paper",components:{"minecraft:item_model":"lockdown:machine/force_field_projector_off"}}}
execute align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {brightness:{block: 15, sky: 15}, transformation: {scale: [1.01f, 1.01f, 1.01f], translation: [0.0f, 0.0f, 0.0f], left_rotation: {angle: 1.5707963267948966, axis: [1.0f, 0.0f, 0.0f]}, right_rotation: [0.0f, 0.0f, 0.0f, 1.0f]}, Tags:["lockdown.block", "lockdown.force_field_projector", "lockdown.block.root", "lockdown.block.display", "lockdown.block.root.new", "lockdown.block.display.new"],item:{id:"minecraft:paper",components:{"minecraft:item_model":"lockdown:machine/force_field_projector_off"}}}

# Summon and mount secondary display entity
execute align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {interpolation_duration: 4, brightness:{block: 15, sky: 15}, transformation: {scale: [0.0f, 0.0f, 0.0f], translation: [0.0f, 0.0f, 0.5f], left_rotation: {angle: 1.5707963267948966, axis: [1.0f, 0.0f, 0.0f]}, right_rotation: [0.0f, 0.0f, 0.0f, 1.0f]}, Tags:["lockdown.block", "lockdown.force_field_projector", "lockdown.force_field_projector.shield", "lockdown.force_field_projector.shield.new"],item:{id:"minecraft:paper",components:{"minecraft:item_model":"lockdown:force_field","minecraft:custom_model_data": {floats:[0.0f]}}}}
ride @n[tag=lockdown.force_field_projector.shield.new] mount @n[tag=lockdown.block.root.new]

# Set scores
scoreboard players set @n[tag=lockdown.block.root.new] lockdown.active_mode 0
scoreboard players set @n[tag=lockdown.block.root.new] lockdown.current_mode 0

# The laser projector can face all four cardinal directions AND
# can be placed upright, sideways, or upside-down.  This leads
# to the following possible states:
# * Upright + facing north
# * Upright + facing south
# * Upright + facing east
# * Upright + facing west
# * Sideways + facing north
# * Sideways + facing south
# * Sideways + facing east
# * Sideways + facing west
# * Upside-down + facing north
# * Upside-down + facing south
# * Upside-down + facing east
# * Upside-down + facing west
#
# The player's direction provides the former, while the item
# frame's orientation provides the latter.

# Obtain the two orientations
# 2=north
# 3=south
# 4=west
# 5=east
execute store result score lockdown.direction lockdown.local run function lockdown:place_block/place/common_cardinal_direction
# 0=down
# 1=side
# 2=up
execute store result score lockdown.facing lockdown.local run data get entity @s Facing
scoreboard players set lockdown.side lockdown.local 0
execute if score lockdown.facing lockdown.local matches 0 run scoreboard players set lockdown.side lockdown.local 0
execute if score lockdown.facing lockdown.local matches 1 run scoreboard players set lockdown.side lockdown.local 2
execute if score lockdown.facing lockdown.local matches 2.. run scoreboard players set lockdown.side lockdown.local 1

#tellraw @a [{text: "Side: "}, {score: {name: "lockdown.side", objective: "lockdown.local"}}, {text: ", Direction: "}, {score: {name: "lockdown.direction", objective: "lockdown.local"}}]

## Upright
# Rotate primary display entity according to the source player's rotation
execute if score lockdown.side lockdown.local matches 2 if score lockdown.direction lockdown.local matches 3 run rotate @n[tag=lockdown.force_field_projector.shield.new] 0.0 -90.0
execute if score lockdown.side lockdown.local matches 2 if score lockdown.direction lockdown.local matches 4 run rotate @n[tag=lockdown.force_field_projector.shield.new] 90.0 -90.0
execute if score lockdown.side lockdown.local matches 2 if score lockdown.direction lockdown.local matches 2 run rotate @n[tag=lockdown.force_field_projector.shield.new] 180.0 -90.0
execute if score lockdown.side lockdown.local matches 2 if score lockdown.direction lockdown.local matches 5 run rotate @n[tag=lockdown.force_field_projector.shield.new] -90.0 -90.0
execute if score lockdown.side lockdown.local matches 2 run tag @n[tag=lockdown.force_field_projector.shield.new] add lockdown.side.up

# Rotate secondary display entity according to the source player's rotation
execute if score lockdown.side lockdown.local matches 2 if score lockdown.direction lockdown.local matches 3 run rotate @n[tag=lockdown.block.display.new] 0.0 -90.0
execute if score lockdown.side lockdown.local matches 2 if score lockdown.direction lockdown.local matches 4 run rotate @n[tag=lockdown.block.display.new] 90.0 -90.0
execute if score lockdown.side lockdown.local matches 2 if score lockdown.direction lockdown.local matches 2 run rotate @n[tag=lockdown.block.display.new] 180.0 -90.0
execute if score lockdown.side lockdown.local matches 2 if score lockdown.direction lockdown.local matches 5 run rotate @n[tag=lockdown.block.display.new] -90.0 -90.0
execute if score lockdown.side lockdown.local matches 2 run tag @n[tag=lockdown.block.display.new] add lockdown.side.up


## Sideways
# Rotate primary display entity according to the source player's rotation
execute if score lockdown.side lockdown.local matches 1 if score lockdown.direction lockdown.local matches 3 run rotate @n[tag=lockdown.force_field_projector.shield.new] 180.0 0.0
execute if score lockdown.side lockdown.local matches 1 if score lockdown.direction lockdown.local matches 4 run rotate @n[tag=lockdown.force_field_projector.shield.new] -90.0 0.0
execute if score lockdown.side lockdown.local matches 1 if score lockdown.direction lockdown.local matches 2 run rotate @n[tag=lockdown.force_field_projector.shield.new] 0.0 0.0
execute if score lockdown.side lockdown.local matches 1 if score lockdown.direction lockdown.local matches 5 run rotate @n[tag=lockdown.force_field_projector.shield.new] 90.0 0.0
execute if score lockdown.side lockdown.local matches 1 run tag @n[tag=lockdown.force_field_projector.shield.new] add lockdown.side.side

# Rotate secondary display entity according to the source player's rotation
execute if score lockdown.side lockdown.local matches 1 if score lockdown.direction lockdown.local matches 3 run rotate @n[tag=lockdown.block.display.new] 180.0 0.0
execute if score lockdown.side lockdown.local matches 1 if score lockdown.direction lockdown.local matches 4 run rotate @n[tag=lockdown.block.display.new] -90.0 0.0
execute if score lockdown.side lockdown.local matches 1 if score lockdown.direction lockdown.local matches 2 run rotate @n[tag=lockdown.block.display.new] 0.0 0.0
execute if score lockdown.side lockdown.local matches 1 if score lockdown.direction lockdown.local matches 5 run rotate @n[tag=lockdown.block.display.new] 90.0 0.0
execute if score lockdown.side lockdown.local matches 1 run tag @n[tag=lockdown.block.display.new] add lockdown.side.side


## Upside-Down
# Rotate primary display entity according to the source player's rotation
execute if score lockdown.side lockdown.local matches 0 if score lockdown.direction lockdown.local matches 3 run rotate @n[tag=lockdown.force_field_projector.shield.new] 0.0 90.0
execute if score lockdown.side lockdown.local matches 0 if score lockdown.direction lockdown.local matches 4 run rotate @n[tag=lockdown.force_field_projector.shield.new] 90.0 90.0
execute if score lockdown.side lockdown.local matches 0 if score lockdown.direction lockdown.local matches 2 run rotate @n[tag=lockdown.force_field_projector.shield.new] 180.0 90.0
execute if score lockdown.side lockdown.local matches 0 if score lockdown.direction lockdown.local matches 5 run rotate @n[tag=lockdown.force_field_projector.shield.new] -90.0 90.0
execute if score lockdown.side lockdown.local matches 0 run tag @n[tag=lockdown.force_field_projector.shield.new] add lockdown.side.down

# Rotate secondary display entity according to the source player's rotation
execute if score lockdown.side lockdown.local matches 0 if score lockdown.direction lockdown.local matches 3 run rotate @n[tag=lockdown.block.display.new] 0.0 90.0
execute if score lockdown.side lockdown.local matches 0 if score lockdown.direction lockdown.local matches 4 run rotate @n[tag=lockdown.block.display.new] 90.0 90.0
execute if score lockdown.side lockdown.local matches 0 if score lockdown.direction lockdown.local matches 2 run rotate @n[tag=lockdown.block.display.new] 180.0 90.0
execute if score lockdown.side lockdown.local matches 0 if score lockdown.direction lockdown.local matches 5 run rotate @n[tag=lockdown.block.display.new] -90.0 90.0
execute if score lockdown.side lockdown.local matches 0 run tag @n[tag=lockdown.block.display.new] add lockdown.side.down
