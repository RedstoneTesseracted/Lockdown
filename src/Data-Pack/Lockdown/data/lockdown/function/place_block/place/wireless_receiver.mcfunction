# Place a wireless receiver block at current position
##### BEGIN INFO BLOCK #####
# > WARNING: This block is used by generate_templates.py to fill in certain details
# > when automatically generating the device placer unit tests.  Change it with caution!
# Solid: true
# Block: minecraft:red_terracotta
# Entity: item_frame
# Directions 0
# Channels: true
# Colors: false
# Extra Parts:
# Placement Rules: requires_channel, solid_block_placement
# Destruction Rule: block_break
###### END INFO BLOCK ######

# Needed for the channel-to-item assignment code in lockdown:place_block/reject/generic
execute store result score lockdown.channel lockdown.local run data get entity @s data.lockdown_data.channel

# Requires enough room
execute unless block ~ ~ ~ #minecraft:replaceable run return run function lockdown:place_block/reject/generic {msg: "lockdown.placer.reject.not_enough_space", dropper: "lockdown:drop/wireless_receiver"}
execute align xyz if entity @e[dx=0.1, dy=0.1, dz=0.1,type=!#lockdown:strict_placement_nonblocking,tag=!lockdown.placer] run return run function lockdown:place_block/reject/generic {msg: "lockdown.placer.reject.not_enough_space", dropper: "lockdown:drop/wireless_receiver"}

# Requires channel
execute unless score lockdown.channel lockdown.local matches 1.. run return run function lockdown:place_block/reject/generic {msg: "lockdown.placer.reject.no_channel", dropper: "lockdown:drop/wireless_receiver"}

# Play effects
playsound minecraft:block.stone.place block @a ~ ~ ~ 1.0 1.0

# Set base block
setblock ~ ~ ~ minecraft:red_terracotta destroy

# Summon display entity
execute align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {brightness:{block: 15, sky: 15}, transformation:[1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f], Tags:["lockdown.block", "lockdown.wireless_receiver", "lockdown.block.root", "lockdown.block.display", "lockdown.block.root.new", "lockdown.block.display.new"],item:{id:"minecraft:paper",components:{"minecraft:item_model":"lockdown:machine/receiver_off"}}}

# Behavior tags
tag @n[tag=lockdown.block.root.new] add lockdown.channel.receiver

# Assign channel
scoreboard players operation @n[tag=lockdown.block.root.new] lockdown.channel = lockdown.channel lockdown.local
execute as @n[tag=lockdown.block.root.new] run function lockdown:channels/update
