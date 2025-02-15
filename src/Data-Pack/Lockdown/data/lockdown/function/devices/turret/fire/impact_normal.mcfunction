# This function runs whenever the turret laser hits an entity.
# This is run BY the entity that got hit

# Save position for later in lockdown:devices/turret/fire/configure_beam
execute summon minecraft:marker run function lockdown:devices/turret/fire/save_position

# Apply damage
$damage @s $(damage) lockdown:turret_laser

# Play effects
particle minecraft:dust{color:[1.0f, 0.0f, 0.0f],scale:1.0f} ~ ~ ~ 0 0 0 0.0 5

# Success!
return 1
