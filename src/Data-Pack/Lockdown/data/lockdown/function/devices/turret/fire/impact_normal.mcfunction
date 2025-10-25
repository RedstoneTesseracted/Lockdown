# This function runs whenever the turret laser hits an entity.
# This is run BY the entity that got hit

# Save position for later in lockdown:devices/turret/fire/configure_beam
execute summon minecraft:marker run function lockdown:devices/turret/fire/save_position

# Apply damage
$damage @s $(damage) lockdown:turret_laser by @e[tag=lockdown.turret.source,limit=1,type=minecraft:bee]

# Play effects
execute at @s run particle minecraft:dust{color:[1.0f, 0.0f, 0.0f],scale:1.0f} ~ ~ ~ 0.25 0.4 0.25 0.3 20

# Success!
return 1
