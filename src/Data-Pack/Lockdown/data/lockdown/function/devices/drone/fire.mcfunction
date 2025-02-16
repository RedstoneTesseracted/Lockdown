# This function handles firing the drone's laser at a target entity.
# This is run BY and AT the root drone entity, and is called from lockdown:devices/drone/hostile

# Mark target entity with a tag
execute at @s on vehicle on target run tag @s add lockdown.drone.target

# Fire the corresponding projectile
execute unless entity @s[tag=lockdown.behavior.flamethrower] run function lockdown:devices/drone/fire/laser
execute if entity @s[tag=lockdown.behavior.flamethrower] run function lockdown:devices/drone/fire/fireball

# Play effects
execute unless entity @s[tag=lockdown.behavior.flamethrower] run playsound minecraft:entity.illusioner.prepare_mirror neutral @a ~ ~ ~ 1 2.0
execute if entity @s[tag=lockdown.behavior.flamethrower] run playsound minecraft:item.firecharge.use neutral @a ~ ~ ~ 1 0.75

# Reset context tags
tag @e[tag=lockdown.drone.target] remove lockdown.drone.target
