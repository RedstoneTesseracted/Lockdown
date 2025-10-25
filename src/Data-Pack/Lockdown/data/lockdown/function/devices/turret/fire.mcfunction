# This function fires the turret's laser at the targeted entity

# Mark the target with a tag.  Abort if the target is missing
execute unless function lockdown:devices/turret/set_target_context run return 0

# Set up arguments for function macros elsewhere
execute store result storage lockdown:temp args.damage int 1 run scoreboard players get @s lockdown.firing_damage

# Perform laser beam raycast
execute on passengers run tag @s add lockdown.turret.hit_exception
execute facing entity @e[tag=lockdown.turret.target,limit=1] eyes run function lockdown:devices/turret/fire/raycast
execute on passengers run tag @s remove lockdown.turret.hit_exception

# Play effects
execute unless entity @s[tag=lockdown.behavior.flamethrower] run playsound lockdown:laser.strong neutral @a ~ ~ ~ 1.5 2.0
execute if entity @s[tag=lockdown.behavior.flamethrower] run playsound minecraft:item.firecharge.use neutral @a ~ ~ ~ 1 0.75
