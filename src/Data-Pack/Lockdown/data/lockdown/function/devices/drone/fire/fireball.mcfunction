# This function launches a fireball projectile at the drone's target
# This is run BY and AT the drone base entity, and is called from
# lockdown:devices/drone/fire when the drone's weapon is a flamethrower.

# Obtain unit vector from drone to target
execute facing entity @e[tag=lockdown.drone.target,limit=1] eyes positioned 0.0 0.0 0.0 positioned ^ ^ ^1 summon minecraft:marker run function lockdown:devices/drone/fire/store_vector

# Play effects
playsound minecraft:item.firecharge.use neutral @a ~ ~ ~ 1 0.75

# Summon fireball
execute facing entity @e[tag=lockdown.drone.target,limit=1] eyes positioned ^ ^ ^0.5 summon minecraft:small_fireball run function lockdown:devices/drone/fire/summon_fireball
