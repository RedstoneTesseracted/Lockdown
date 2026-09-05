# Root function for laser cannon entities
execute if function lockdown:devices/laser_cannon/has_passenger run function lockdown:devices/laser_cannon/rotate
execute if function lockdown:devices/laser_cannon/has_passenger run function lockdown:devices/laser_cannon/fire/update

# A missing block underneath the cannon causes it to break
execute if block ~ ~-1 ~ #minecraft:air run function lockdown:devices/laser_cannon/destroy
