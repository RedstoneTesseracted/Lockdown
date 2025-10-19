# This function launches a laser projectile at the drone's target
# This is run BY and AT the drone base entity, and is called from
# lockdown:devices/drone/fire when the drone's weapon is a laser.

# Obtain the target position (stores result in lockdown:temp target_pos)
execute on vehicle run function lockdown:devices/drone/fire/obtain_target_pos

# Summon laser beam entity
execute store result score lockdown.damage lockdown.local run scoreboard players get @s lockdown.firing_damage
execute store result score lockdown.uuid1 lockdown.local on vehicle run data get entity @s UUID[0]
execute store result score lockdown.uuid2 lockdown.local on vehicle run data get entity @s UUID[1]
execute store result score lockdown.uuid3 lockdown.local on vehicle run data get entity @s UUID[2]
execute store result score lockdown.uuid4 lockdown.local on vehicle run data get entity @s UUID[3]
execute positioned ^ ^-0.6 ^0.1 summon minecraft:armor_stand run function lockdown:devices/drone/fire/summon_laser

# Play effects
# particle minecraft:dust{color:[1.0f,0.0f,0.0f],scale:0.9f} ~ ~ ~ 0.25 0.25 0.25 0.2 15
playsound lockdown:laser.quick neutral @a ~ ~ ~ 1.0 1.0

# Activate the projectile loop if it isn't already running
schedule function lockdown:projectile/tick 1t replace
