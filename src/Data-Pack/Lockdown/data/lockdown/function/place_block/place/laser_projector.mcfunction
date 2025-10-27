# Place a laser projector block at current position
##### BEGIN INFO BLOCK #####
# > WARNING: This block is used by generate_templates.py to fill in certain details
# > when automatically generating the device placer unit tests.  Change it with caution!
# Solid: true
# Block: minecraft:redstone_lamp
# Entity: item_frame
# Directions: 6
# Channels: false
# Colors: false
# Extra Parts: lockdown.laser_projector.beam
# Placement Rules: solid_block_placement
# Destruction Rule: block_break
###### END INFO BLOCK ######

# This prevents the channel-to-item assignment code in lockdown:place_block/reject/generic from running
scoreboard players set lockdown.channel lockdown.local 0

# Requires enough room
execute unless block ~ ~ ~ #minecraft:replaceable run return run function lockdown:place_block/reject/generic {msg: "lockdown.placer.reject.not_enough_space", dropper: "lockdown:drop/laser_projector"}
execute align xyz if entity @e[dx=0.1, dy=0.1, dz=0.1,type=!#lockdown:strict_placement_nonblocking,tag=!lockdown.placer] run return run function lockdown:place_block/reject/generic {msg: "lockdown.placer.reject.not_enough_space", dropper: "lockdown:drop/laser_projector"}

# Play effects
playsound minecraft:block.stone.place block @a ~ ~ ~ 1.0 1.0

# Set base block
setblock ~ ~ ~ minecraft:redstone_lamp destroy

# Summon display entity
execute align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {brightness:{block: 15, sky: 15}, transformation:[1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f], Tags:["lockdown.block", "lockdown.laser_projector", "lockdown.block.root", "lockdown.block.display", "lockdown.block.root.new", "lockdown.block.display.new"],item:{id:"minecraft:paper",components:{"minecraft:item_model":"lockdown:invisible"}}}

# The laser projector is directional
#   0=up
#   1=down
#   2=north
#   3=south
#   4=west
#   5=east
execute store result score lockdown.direction lockdown.local run data get entity @s Facing
execute if score lockdown.direction lockdown.local matches 0 run rotate @n[tag=lockdown.block.display.new] 0.0 90.0
execute if score lockdown.direction lockdown.local matches 1 run rotate @n[tag=lockdown.block.display.new] 0.0 -90.0
execute if score lockdown.direction lockdown.local matches 2 run rotate @n[tag=lockdown.block.display.new] 180.0 0.0
execute if score lockdown.direction lockdown.local matches 3 run rotate @n[tag=lockdown.block.display.new] 0.0 0.0
execute if score lockdown.direction lockdown.local matches 4 run rotate @n[tag=lockdown.block.display.new] 90.0 0.0
execute if score lockdown.direction lockdown.local matches 5 run rotate @n[tag=lockdown.block.display.new] -90.0 0.0
execute as @n[tag=lockdown.block.root.new] run function lockdown:place_block/place/common_directional

# Summon and mount the beam display entity
execute align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {brightness:{block: 15, sky: 15}, interpolation_duration: 2, transformation:[0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.5f, 0.0f, 0.0f, 0.0f, 1.0f], Tags:["lockdown.block", "lockdown.laser_projector", "lockdown.laser_projector.beam", "lockdown.laser_projector.beam.new"],item:{id:"minecraft:paper",components:{"minecraft:item_model":"lockdown:laser_beam"}}}
ride @n[tag=lockdown.laser_projector.beam.new] mount @n[tag=lockdown.block.root]
execute if score lockdown.direction lockdown.local matches 0 run rotate @n[tag=lockdown.laser_projector.beam.new] 0.0 90.0
execute if score lockdown.direction lockdown.local matches 1 run rotate @n[tag=lockdown.laser_projector.beam.new] 0.0 -90.0
execute if score lockdown.direction lockdown.local matches 2 run rotate @n[tag=lockdown.laser_projector.beam.new] 180.0 0.0
execute if score lockdown.direction lockdown.local matches 3 run rotate @n[tag=lockdown.laser_projector.beam.new] 0.0 0.0
execute if score lockdown.direction lockdown.local matches 4 run rotate @n[tag=lockdown.laser_projector.beam.new] 90.0 0.0
execute if score lockdown.direction lockdown.local matches 5 run rotate @n[tag=lockdown.laser_projector.beam.new] -90.0 0.0

# It is now safe to show the model without a weird visual glitch
data modify entity @n[tag=lockdown.block.display.new] item.components."minecraft:item_model" set value "lockdown:machine/laser_projector_off"

