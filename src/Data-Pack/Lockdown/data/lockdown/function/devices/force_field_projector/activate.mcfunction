# This function handles force field's activation
# It is run BY and AT the root force field entity

# Update state tags
tag @s add lockdown.powered

# Abort if there's not enough room
execute store result score @s lockdown.active_mode run function lockdown:devices/force_field_projector/mode_from_block_state
scoreboard players operation @s lockdown.current_mode = @s lockdown.active_mode
execute unless function lockdown:devices/force_field_projector/check run return run function lockdown:devices/force_field_projector/failed

tag @s remove lockdown.blocked
tag @s add lockdown.projecting

# Play effects
playsound minecraft:block.beacon.activate block @a ~ ~ ~ 1 2

# Update model
data modify entity @s[tag=lockdown.block.display] item.components."minecraft:item_model" set value "lockdown:machine/force_field_projector_on"
scoreboard players operation lockdown.active_mode lockdown.local = @s lockdown.active_mode
execute on passengers if entity @s[tag=lockdown.force_field_projector.shield] store result entity @s item.components."minecraft:custom_model_data".floats[0] float 1.0 run scoreboard players get lockdown.active_mode lockdown.local
execute on passengers if entity @s[tag=lockdown.force_field_projector.shield] run data modify entity @s transformation.scale set value [5.0f, 5.0f, 5.0f]
execute on passengers if entity @s[tag=lockdown.force_field_projector.shield] run data modify entity @s start_interpolation set value 0

# Fill blocks
function lockdown:devices/force_field_projector/fill/air_to_barrier
