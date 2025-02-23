# This function updates the visual effect of the drone floating up and down
# This is run BY and AT the root drone entity

# Common
data modify entity @s start_interpolation set value 0

# Float up
execute if score @s lockdown.drone.float matches 0 run data modify entity @s transformation.translation[1] set value -0.15f
execute if score @s lockdown.drone.float matches 0 run return run scoreboard players set @s lockdown.drone.float 1

# Float down
data modify entity @s transformation.translation[1] set value -0.45f
return run scoreboard players set @s lockdown.drone.float 0
