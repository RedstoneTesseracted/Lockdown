# Place a keycard reader block at current position
##### BEGIN INFO BLOCK #####
# > WARNING: This block is used by generate_templates.py to fill in certain details
# > when automatically generating the device placer unit tests.  Change it with caution!
# Solid: true
# Block: minecraft:acacia_button
# Entity: item_frame
# Directions: 4
# Channels: true
# Colors: false
# Extra Parts:
# Placement Rules: requires_channel, solid_block_placement
# Destruction Rule: block_break
###### END INFO BLOCK ######

# Needed for the channel-to-item assignment code in lockdown:place_block/reject/generic
execute store result score lockdown.channel lockdown.local run data get entity @s data.lockdown_data.channel

# Requires enough room
execute unless block ~ ~ ~ #minecraft:replaceable run return run function lockdown:place_block/reject/generic {msg: "lockdown.placer.reject.not_enough_space", dropper: "lockdown:drop/keycard_reader"}
execute align xyz if entity @e[dx=0.1, dy=0.1, dz=0.1,type=!#lockdown:strict_placement_nonblocking,tag=!lockdown.placer] run return run function lockdown:place_block/reject/generic {msg: "lockdown.placer.reject.not_enough_space", dropper: "lockdown:drop/keycard_reader"}

# Requires channel
execute unless score lockdown.channel lockdown.local matches 1.. run return run function lockdown:place_block/reject/generic {msg: "lockdown.placer.reject.no_code", dropper: "lockdown:drop/keycard_reader"}

# Play effects
playsound minecraft:block.stone.place block @a ~ ~ ~ 1.0 1.0

# Set base block
setblock ~ ~ ~ minecraft:red_terracotta destroy

# Get direction based on source's direction
execute store result score lockdown.direction lockdown.local run function lockdown:place_block/place/common_cardinal_direction

# Summon display entity (with appropriate direction)
execute if score lockdown.direction lockdown.local matches 2 align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {Rotation:[0.0f, 0.0f], brightness:{block: 15, sky: 15}, transformation:[1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f], Tags:["lockdown.block", "lockdown.keycard_reader", "lockdown.block.root", "lockdown.block.display", "lockdown.block.root.new", "lockdown.block.display.new"],item:{id:"minecraft:paper",components:{"minecraft:item_model":"lockdown:machine/keycard_reader_off"}}}
execute if score lockdown.direction lockdown.local matches 3 align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {Rotation:[-180.0f, 0.0f], brightness:{block: 15, sky: 15}, transformation:[1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f], Tags:["lockdown.block", "lockdown.keycard_reader", "lockdown.block.root", "lockdown.block.display", "lockdown.block.root.new", "lockdown.block.display.new"],item:{id:"minecraft:paper",components:{"minecraft:item_model":"lockdown:machine/keycard_reader_off"}}}
execute if score lockdown.direction lockdown.local matches 4 align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {Rotation:[-90.0f, 0.0f], brightness:{block: 15, sky: 15}, transformation:[1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f], Tags:["lockdown.block", "lockdown.keycard_reader", "lockdown.block.root", "lockdown.block.display", "lockdown.block.root.new", "lockdown.block.display.new"],item:{id:"minecraft:paper",components:{"minecraft:item_model":"lockdown:machine/keycard_reader_off"}}}
execute if score lockdown.direction lockdown.local matches 5 align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {Rotation:[90.0f, 0.0f], brightness:{block: 15, sky: 15}, transformation:[1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f], Tags:["lockdown.block", "lockdown.keycard_reader", "lockdown.block.root", "lockdown.block.display", "lockdown.block.root.new", "lockdown.block.display.new"],item:{id:"minecraft:paper",components:{"minecraft:item_model":"lockdown:machine/keycard_reader_off"}}}

# Configure the new block
scoreboard players operation @n[tag=lockdown.block.root.new] lockdown.channel = lockdown.channel lockdown.local
