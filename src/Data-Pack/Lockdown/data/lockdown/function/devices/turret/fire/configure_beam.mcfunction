# This function is responsible for configuring the turret beam entity whenever it fires.
# This is run BY the turret beam entity

# Update the transformation
# data modify entity @s transformation.scale[0] set value 0.9f
# data modify entity @s transformation.scale[1] set value 0.9f
execute store result entity @s transformation.scale[0] float 1.0 run scoreboard players get lockdown.attempts lockdown.local
execute store result entity @s transformation.scale[1] float 1.0 run scoreboard players get lockdown.attempts lockdown.local
execute store result entity @s transformation.scale[2] float 1.0 run scoreboard players get lockdown.attempts lockdown.local
execute store result entity @s item.components."minecraft:custom_model_data".floats[0] float 1.0 run scoreboard players get lockdown.attempts lockdown.local
data modify entity @s start_interpolation set value 0

# Save time so we can target this entity again when its time for it to vanish
execute store result score @s lockdown.time run time query gametime

# Schedule function to make this entity vanish
schedule function lockdown:devices/turret/fire/scheduled_beam_vanish 5t append
