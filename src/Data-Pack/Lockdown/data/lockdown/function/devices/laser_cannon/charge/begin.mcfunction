# This function is called by lockdown:devices/laser_cannon/fire/update whenever the cannon starts charging

# Visuals: update model and play sound effect
execute on passengers if entity @s[tag=lockdown.laser_cannon.gantry] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "charging"
execute on passengers if entity @s[tag=lockdown.laser_cannon.barrel] run data modify entity @s item.components."minecraft:custom_model_data".strings[0] set value "charging"
playsound lockdown:cannon.charge neutral @a ~ ~ ~ 1.0 1.0
