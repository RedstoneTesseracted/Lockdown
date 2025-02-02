# Handles deactivation of the laser
# Updates state tags, sets model, and plays effects
tag @s remove lockdown.powered
data modify entity @s[tag=lockdown.block.display] item.components."minecraft:item_model" set value "lockdown:machine/laser_projector_off"
execute on passengers if entity @s[tag=lockdown.laser_projector.beam] run data modify entity @s transformation.scale set value [0.0f, 0.0f, 0.0f]
execute on passengers if entity @s[tag=lockdown.laser_projector.beam] run data modify entity @s start_interpolation set value 0
playsound minecraft:block.fire.extinguish block @a ~ ~ ~ 0.75 2
