# This function runs whenever the turret flamethrower hits an entity.
# This is run BY the entity that got hit

# Save position for later in lockdown:devices/turret/fire/configure_beam
execute summon minecraft:marker run function lockdown:devices/turret/fire/save_position

# Apply damage
$damage @s $(damage) lockdown:firey_turret_laser

# Play effects
particle minecraft:flame ~ ~ ~ 0 0 0 0.3 5
execute at @s if block ~ ~ ~ #minecraft:replaceable run setblock ~ ~ ~ minecraft:fire

# Success!
return 1
