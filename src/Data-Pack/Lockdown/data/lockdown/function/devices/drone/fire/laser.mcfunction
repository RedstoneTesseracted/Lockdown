# This function launches a laser projectile at the drone's target

# Obtain vector from drone to target - we use this as the motion vector
execute facing entity @e[tag=lockdown.drone.target,limit=1] eyes positioned 0.0 0.0 0.0 positioned ^ ^ ^0.5 summon minecraft:marker run function lockdown:devices/drone/fire/store_vector

# Summon laser beam entity
execute store result score lockdown.damage lockdown.local run scoreboard players get @s lockdown.firing_damage
data modify storage lockdown:temp origin set value [I; 0, 0, 0, 0]
execute on vehicle run data modify storage lockdown:temp origin[0] set from entity @s UUID[0]
execute on vehicle run data modify storage lockdown:temp origin[1] set from entity @s UUID[1]
execute on vehicle run data modify storage lockdown:temp origin[2] set from entity @s UUID[2]
execute on vehicle run data modify storage lockdown:temp origin[3] set from entity @s UUID[3]
execute facing entity @e[tag=lockdown.drone.target,limit=1] eyes positioned ^ ^-0.3 ^0.1 summon minecraft:snowball run function lockdown:devices/drone/fire/summon_laser

# Play effects
# particle minecraft:dust{color:[1.0f,0.0f,0.0f],scale:0.9f} ~ ~ ~ 0.25 0.25 0.25 0.2 15
playsound minecraft:entity.illusioner.prepare_mirror neutral @a ~ ~ ~ 1.0 2.0

# Activate the projectile loop if it isn't already running
schedule function lockdown:projectile/tick 1t replace
