# This function launches a laser projectile at the drone's target

# Summon laser beam entity
execute store result score lockdown.damage lockdown.local run scoreboard players get @s lockdown.firing_damage
execute store result score lockdown.uuid1 lockdown.local on vehicle run data get entity @s UUID[0]
execute store result score lockdown.uuid2 lockdown.local on vehicle run data get entity @s UUID[1]
execute store result score lockdown.uuid3 lockdown.local on vehicle run data get entity @s UUID[2]
execute store result score lockdown.uuid4 lockdown.local on vehicle run data get entity @s UUID[3]
execute facing entity @e[tag=lockdown.drone.target,limit=1] eyes positioned ^ ^-0.6 ^0.1 summon minecraft:armor_stand run function lockdown:devices/drone/fire/summon_laser

# Play effects
# particle minecraft:dust{color:[1.0f,0.0f,0.0f],scale:0.9f} ~ ~ ~ 0.25 0.25 0.25 0.2 15
playsound minecraft:entity.illusioner.prepare_mirror neutral @a ~ ~ ~ 1.0 2.0

# Activate the projectile loop if it isn't already running
schedule function lockdown:projectile/tick 1t replace
