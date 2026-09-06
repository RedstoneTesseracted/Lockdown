# Root function for laser cannon entities
execute if function lockdown:devices/laser_cannon/has_passenger run function lockdown:devices/laser_cannon/rotate
execute if function lockdown:devices/laser_cannon/has_passenger run function lockdown:devices/laser_cannon/charge/update
execute if score @s lockdown.cannon.fire_state matches 1.. run function lockdown:devices/laser_cannon/fire/update

# A missing block underneath the cannon causes it to break
execute if block ~ ~-1 ~ #minecraft:air run function lockdown:devices/laser_cannon/destroy
