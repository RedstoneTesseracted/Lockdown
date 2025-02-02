# Handles activation of the laser projector.
# Updates state tags, sets model, and plays effects.
tag @s add lockdown.powered
data modify entity @s[tag=lockdown.block.display] item.components."minecraft:item_model" set value "lockdown:machine/laser_projector_on"
execute on passengers if entity @s[tag=lockdown.laser_projector.beam] run data modify entity @s transformation.scale set value [1.0f, 1.0f, 1.0f]
execute on passengers if entity @s[tag=lockdown.laser_projector.beam] run data modify entity @s start_interpolation set value 0
playsound minecraft:entity.zombie.infect block @a ~ ~ ~ 0.75 2
