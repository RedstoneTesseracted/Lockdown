# This function handles force field's activation
# It is run BY and AT the root force field entity

# Play effects
execute if entity @s[tag=lockdown.projecting] run playsound minecraft:block.beacon.deactivate block @a ~ ~ ~ 1 2

# Update model
data modify entity @s[tag=lockdown.block.display] item.components."minecraft:item_model" set value "lockdown:machine/force_field_projector_off"
execute on passengers if entity @s[tag=lockdown.force_field_projector.shield] run data modify entity @s transformation.scale set value [0.0f, 0.0f, 0.0f]
execute on passengers if entity @s[tag=lockdown.force_field_projector.shield] run data modify entity @s start_interpolation set value 0

# Remove the barrier blocks
function lockdown:devices/force_field_projector/fill_air

# Update state tags
tag @s remove lockdown.projecting
tag @s remove lockdown.powered
