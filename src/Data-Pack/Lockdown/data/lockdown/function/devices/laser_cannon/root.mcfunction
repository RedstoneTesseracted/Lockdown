# Root function for laser cannon entities
execute if function lockdown:devices/laser_cannon/has_passenger run function lockdown:devices/laser_cannon/rotate
execute if function lockdown:devices/laser_cannon/has_passenger run function lockdown:devices/laser_cannon/charge/update
execute if score @s lockdown.cannon.fire_state matches 1.. run function lockdown:devices/laser_cannon/fire/update

# A missing block underneath the cannon causes it to break
execute if block ~ ~-1 ~ #minecraft:air run function lockdown:devices/laser_cannon/destroy

# Missing the damage detection armor stand causes the cannon to explode.
# This only applies when the laser cannon has a gantry
execute if entity @s[tag=lockdown.laser_cannon.has_gantry] unless predicate lockdown:has_live_bee_passenger run function lockdown:devices/laser_cannon/explode
