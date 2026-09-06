# This function is used in the beam firing animation to expand the beam to its maximum size.
# This is run BY the beam entity.

#data modify entity @s transformation.scale set value [5.0, 5.0, 25.0]
#data modify entity @s transformation.scale[2] set value 25.0

# lockdown.distance should have been set by distance_raycast outside of this function
scoreboard players operation lockdown.beam_length lockdown.local = lockdown.distance lockdown.local
scoreboard players add lockdown.beam_length lockdown.local 5

execute store result entity @s transformation.scale[0] float 0.3 run scoreboard players get @s lockdown.cannon.charge
execute store result entity @s transformation.scale[1] float 0.3 run scoreboard players get @s lockdown.cannon.charge
execute store result entity @s transformation.scale[2] float 1.0 run scoreboard players get lockdown.beam_length lockdown.local
data modify entity @s start_interpolation set value 0
