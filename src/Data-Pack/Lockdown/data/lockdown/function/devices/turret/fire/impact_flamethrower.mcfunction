# This function runs whenever the turret flamethrower hits an entity.
# This is run BY the entity that got hit

# Save position for later in lockdown:devices/turret/fire/configure_beam
execute summon minecraft:marker run function lockdown:devices/turret/fire/save_position

# Apply damage
$damage @s $(damage) lockdown:firey_turret_laser

# Play effects
execute at @s run particle minecraft:flame ~ ~ ~ 0.25 0.4 0.25 0.3 20
execute at @s if block ~ ~ ~ #minecraft:replaceable run setblock ~ ~ ~ minecraft:fire

# Success!
return 1
