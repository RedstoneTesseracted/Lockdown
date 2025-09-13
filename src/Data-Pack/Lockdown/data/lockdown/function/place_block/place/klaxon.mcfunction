# Place a klaxon block at current position
##### BEGIN INFO BLOCK #####
# > WARNING: This block is used by generate_templates.py to fill in certain details
# > when automatically generating the device placer unit tests.  Change it with caution!
# Solid: true
# Block: minecraft:note_block
# Entity: marker
# Directions 0
# Channels: false
# Colors: false
# Extra Parts:
# Placement Rules: solid_block_placement
###### END INFO BLOCK ######

# Requires enough room
execute unless block ~ ~ ~ #minecraft:replaceable run return run function lockdown:place_block/reject/generic {msg: "lockdown.placer.reject.not_enough_space", loot: "lockdown:item/klaxon"}
execute align xyz if entity @e[dx=0.1, dy=0.1, dz=0.1,type=!#lockdown:strict_placement_nonblocking,tag=!lockdown.placer] run return run function lockdown:place_block/reject/generic {msg: "lockdown.placer.reject.not_enough_space", loot: "lockdown:item/klaxon"}

# Play effects
playsound minecraft:block.stone.place block @a ~ ~ ~ 1.0 1.0

# Set base block
setblock ~ ~ ~ minecraft:note_block destroy

# Summon display entity
execute align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {brightness:{block: 15, sky: 15}, transformation:[1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f], Tags:["lockdown.block", "lockdown.klaxon", "lockdown.block.root", "lockdown.block.display", "lockdown.block.root.new", "lockdown.block.display.new"],item:{id:"minecraft:paper",components:{"minecraft:item_model":"lockdown:machine/klaxon_off"}}}
