# Place an encoding station block at current position

# Requires enough room
execute unless block ~ ~ ~ #minecraft:replaceable run return run function lockdown:place_block/reject/generic {msg: "lockdown.placer.reject.not_enough_space", loot: "lockdown:item/encoding_station"}
execute align xyz if entity @e[dx=0.1, dy=0.1, dz=0.1,type=!#lockdown:strict_placement_nonblocking,tag=!lockdown.placer] run return run function lockdown:place_block/reject/generic {msg: "lockdown.placer.reject.not_enough_space", loot: "lockdown:item/encoding_station"}

# Play effects
playsound minecraft:block.stone.place block @a ~ ~ ~ 1.0 1.0

# Set base block
setblock ~ ~ ~ minecraft:dropper[facing=up]{CustomName:'{"translate": "gui.lockdown.encoder.name"}'}
function lockdown:devices/encoder/restore_gui

# Summon display entity
execute align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {brightness:{block: 15, sky: 15}, transformation:[1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f], Tags:["lockdown.block", "lockdown.encoder", "lockdown.block.root", "lockdown.block.display", "lockdown.block.root.new", "lockdown.block.display.new"],item:{id:"minecraft:paper",components:{"minecraft:item_model":"lockdown:machine/encoding_station"}}}
