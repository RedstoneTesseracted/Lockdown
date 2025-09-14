# Place an encoding station block at current position
##### BEGIN INFO BLOCK #####
# > WARNING: This block is used by generate_templates.py to fill in certain details
# > when automatically generating the device placer unit tests.  Change it with caution!
# Solid: true
# Block: minecraft:dropper[facing=up,triggered=false]{CustomName:{translate:"gui.lockdown.encoder.name"},Items:[{Slot:0b,components:{"minecraft:custom_data":{lockdown_data:{forbidden:1b,slot:0b}},"minecraft:item_model":"lockdown:gui/encoder","minecraft:max_stack_size":1,"minecraft:tooltip_display":{hide_tooltip:1b}},count:1,id:"minecraft:paper"},{Slot:1b,components:{"minecraft:custom_data":{lockdown_data:{forbidden:1b,slot:1b}},"minecraft:item_model":"lockdown:invisible","minecraft:max_stack_size":1,"minecraft:tooltip_display":{hide_tooltip:1b}},count:1,id:"minecraft:paper"},{Slot:2b,components:{"minecraft:custom_data":{lockdown_data:{forbidden:1b,slot:2b}},"minecraft:item_model":"lockdown:invisible","minecraft:max_stack_size":1,"minecraft:tooltip_display":{hide_tooltip:1b}},count:1,id:"minecraft:paper"},{Slot:3b,components:{"minecraft:custom_data":{lockdown_data:{forbidden:1b,slot:3b}},"minecraft:item_model":"lockdown:invisible","minecraft:max_stack_size":1,"minecraft:tooltip_display":{hide_tooltip:1b}},count:1,id:"minecraft:paper"},{Slot:5b,components:{"minecraft:custom_data":{lockdown_data:{forbidden:1b,slot:5b}},"minecraft:item_model":"lockdown:gui/checkmark","minecraft:item_name":{color:"green",translate:"gui.lockdown.encoder.confirm"},"minecraft:max_stack_size":1},count:1,id:"minecraft:paper"}]}
# Entity: marker
# Directions 0
# Channels: false
# Colors: false
# Extra Parts:
# Special: true
# Placement Rules: solid_block_placement
###### END INFO BLOCK ######

# Requires enough room
execute unless block ~ ~ ~ #minecraft:replaceable run return run function lockdown:place_block/reject/generic {msg: "lockdown.placer.reject.not_enough_space", loot: "lockdown:drop/encoding_station"}
execute align xyz if entity @e[dx=0.1, dy=0.1, dz=0.1,type=!#lockdown:strict_placement_nonblocking,tag=!lockdown.placer] run return run function lockdown:place_block/reject/generic {msg: "lockdown.placer.reject.not_enough_space", loot: "lockdown:drop/encoding_station"}

# Play effects
playsound minecraft:block.stone.place block @a ~ ~ ~ 1.0 1.0

# Set base block
setblock ~ ~ ~ minecraft:dropper[facing=up]{CustomName:{translate: "gui.lockdown.encoder.name"}} destroy
function lockdown:devices/encoder/restore_gui

# Summon display entity
execute align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {brightness:{block: 15, sky: 15}, transformation:[1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f], Tags:["lockdown.block", "lockdown.encoder", "lockdown.block.root", "lockdown.block.display", "lockdown.block.root.new", "lockdown.block.display.new"],item:{id:"minecraft:paper",components:{"minecraft:item_model":"lockdown:machine/encoding_station"}}}
