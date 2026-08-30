# Root function for laser cannon entities
execute if entity @s[tag=lockdown.laser_cannon.has_gantry] run function lockdown:devices/laser_cannon/rotate_gantry

# A missing block underneath the cannon causes it to break
execute if block ~ ~-1 ~ #minecraft:air run function lockdown:devices/laser_cannon/destroy
