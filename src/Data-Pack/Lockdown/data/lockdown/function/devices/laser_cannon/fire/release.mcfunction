# This function runs whenever the pilot fires the cannon.
# This is run BY and AT the root cannon entity

# Visuals: update model and play sound effects
execute on passengers if entity @s[tag=lockdown.laser_cannon.gantry] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "idle"
execute on passengers if entity @s[tag=lockdown.laser_cannon.barrel] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "idle"
execute if score @s lockdown.cannon.charge >= lockdown.cannon_max_charge lockdown.constant run playsound lockdown:cannon.fire neutral @a ~ ~ ~ 1.0 1.0
execute if score @s lockdown.cannon.charge < lockdown.cannon_max_charge lockdown.constant run playsound lockdown:cannon.fire neutral @a ~ ~ ~ 0.5 0.9
#playsound lockdown:cannon.fire neutral @a ~ ~ ~ 1.0 1.0

say cannon fires

# Reset charge counter
scoreboard players set @s lockdown.cannon.charge 0
