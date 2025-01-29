# Place a force field projector block at current position

# Requires enough room
execute unless block ~ ~ ~ #minecraft:replaceable run return run function lockdown:place_block/reject/generic {msg: "lockdown.placer.reject.not_enough_space", loot: "lockdown:item/force_field_projector"}
execute align xyz if entity @e[dx=0.1, dy=0.1, dz=0.1,type=!#lockdown:strict_placement_nonblocking,tag=!lockdown.placer] run return run function lockdown:place_block/reject/generic {msg: "lockdown.placer.reject.not_enough_space", loot: "lockdown:item/force_field_projector"}

# Play effects
playsound minecraft:block.stone.place block @a ~ ~ ~ 1.0 1.0

# Set base block
setblock ~ ~ ~ minecraft:note_block

# Summon display entity
execute align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {brightness:{block: 15, sky: 15}, transformation:[1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.01f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f], Tags:["lockdown.block", "lockdown.force_field_projector", "lockdown.block.root", "lockdown.block.display", "lockdown.block.root.new", "lockdown.block.display.new"],item:{id:"minecraft:paper",components:{"minecraft:item_model":"lockdown:machine/force_field_projector_off"}}}

# Summon and mount secondary display entity
execute align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {interpolation_duration: 4, brightness:{block: 15, sky: 15}, transformation:[0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.5f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f], Tags:["lockdown.block", "lockdown.force_field_projector", "lockdown.force_field_projector.shield", "lockdown.force_field_projector.shield.new"],item:{id:"minecraft:paper",components:{"minecraft:item_model":"lockdown:force_field","minecraft:custom_model_data": {floats:[0.0f]}}}}
ride @n[tag=lockdown.force_field_projector.shield.new] mount @n[tag=lockdown.block.root.new]

# Rotate secondary display entity according to the source player's rotation
execute if entity @a[limit=1,tag=lockdown.placer.source,y_rotation=-45..45] run rotate @n[tag=lockdown.force_field_projector.shield.new] 0.0 0.0
execute if entity @a[limit=1,tag=lockdown.placer.source,y_rotation=45..135] run rotate @n[tag=lockdown.force_field_projector.shield.new] 90.0 0.0
execute if entity @a[limit=1,tag=lockdown.placer.source,y_rotation=135..-135] run rotate @n[tag=lockdown.force_field_projector.shield.new] 180.0 0.0
execute if entity @a[limit=1,tag=lockdown.placer.source,y_rotation=-135..-45] run rotate @n[tag=lockdown.force_field_projector.shield.new] -90.0 0.0

