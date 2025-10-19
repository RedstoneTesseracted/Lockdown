# This function launches a fireball projectile at the drone's target
# This is run BY and AT the drone base entity, and is called from
# lockdown:devices/drone/fire when the drone's weapon is a flamethrower.

# Obtain the target position (stores result in lockdown:temp target_pos)
execute on vehicle run function lockdown:devices/drone/fire/obtain_target_pos

# Play effects
playsound minecraft:item.firecharge.use neutral @a ~ ~ ~ 1 0.75

# Summon fireball
execute on vehicle run data modify storage lockdown:temp origin set from entity @s UUID
execute positioned ^ ^ ^0.5 summon minecraft:small_fireball run function lockdown:devices/drone/fire/summon_fireball
data remove storage lockdown:temp origin
