# This function updates the visual effect of the drone floating up and down
# This is run BY and AT the drone display entity
#
# This works by generating a circle and using the y-coordinate to set the physical position.
# To generate said circle, we use the following algorithm:
#   y -= x // k
#   x += y // k
#
# (Note: "//" denotes integer divide)
# (Note: this feels like magic)
#
# The drone floats between -0.40 and -0.10
# The amplitude (0.10) is set using the initial values for x and y (see lockdown:place_block/place/drone)
# The midpoint (0.30) is set below by adding an offset
# Period is approximately obtained by the division factor: T ≈ 2πk.  Here, k=10 is chosen for a period of ~63 ticks (~3 seconds)


scoreboard players operation lockdown.drone.float.x lockdown.local = @s lockdown.drone.float.x
scoreboard players operation lockdown.drone.float.x lockdown.local /= 10 lockdown.number
scoreboard players operation @s lockdown.drone.float.y -= lockdown.drone.float.x lockdown.local

scoreboard players operation lockdown.drone.float.y lockdown.local = @s lockdown.drone.float.y
scoreboard players operation lockdown.drone.float.y lockdown.local /= 10 lockdown.number
scoreboard players operation @s lockdown.drone.float.x += lockdown.drone.float.y lockdown.local

scoreboard players operation lockdown.drone.float.y lockdown.local = @s lockdown.drone.float.y
scoreboard players remove lockdown.drone.float.y lockdown.local 3000

# Update transformation
data modify entity @s start_interpolation set value 0
execute store result entity @s transformation.translation[1] float 0.0001 run scoreboard players get lockdown.drone.float.y lockdown.local
