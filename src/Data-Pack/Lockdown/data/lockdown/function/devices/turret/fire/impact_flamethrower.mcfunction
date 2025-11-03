# This function runs whenever the turret flamethrower hits an entity.
# This is run BY the entity that got hit

# Save position for later in lockdown:devices/turret/fire/configure_beam
execute summon minecraft:marker run function lockdown:devices/turret/fire/save_position

# Apply damage
$damage @s $(damage) lockdown:firey_turret_laser by @e[tag=lockdown.turret.source,limit=1,type=minecraft:bee]

# Ignite creepers
data modify entity @s[type=minecraft:creeper] ignited set value 1b

# Play effects
execute at @s run particle minecraft:flame ~ ~ ~ 0.25 0.4 0.25 0.15 40
execute at @s if block ~ ~ ~ #minecraft:replaceable run setblock ~ ~ ~ minecraft:fire

# Success!
return 1
