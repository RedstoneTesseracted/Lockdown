# This function launches a fireball projectile at the drone's target

# Obtain unit vector from drone to target
execute facing entity @e[tag=lockdown.drone.target,limit=1] eyes positioned 0.0 0.0 0.0 positioned ^ ^ ^1 summon minecraft:marker run function lockdown:devices/drone/fire/store_vector

# Summon fireball
execute facing entity @e[tag=lockdown.drone.target,limit=1] eyes positioned ^ ^ ^0.5 summon minecraft:small_fireball run function lockdown:devices/drone/fire/summon_fireball
