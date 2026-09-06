# This function is used in the beam firing animation to dissipate the beam.
# This is run BY the beam entity.

data modify entity @s transformation.scale set value [0.0, 0.0, 0.0]
data modify entity @s start_interpolation set value 1
