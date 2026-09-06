# This function runs when the laser cannon is damaged to the point where it explodes

# Blow up the surrounding area
particle minecraft:explosion ~ ~1 ~ 1 1 1 1 5
playsound minecraft:entity.generic.explode block @a ~ ~ ~ 1 1
summon minecraft:tnt ~ ~0.1 ~ {fuse: 0, explosion_power: 1.0}

# Run standard destruction stuff
function lockdown:devices/laser_cannon/destroy
