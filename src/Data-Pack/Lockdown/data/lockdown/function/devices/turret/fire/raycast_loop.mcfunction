# Recursive function that handles the beam firing

# Increment attempt counter
scoreboard players add lockdown.attempts lockdown.local 1

# # Debug particle effects
# particle minecraft:dust{color:[1.0f, 0.0f, 0.0f],scale:1.0f} ~ ~ ~ 0 0 0 0.0 5

# Stop if beam is obstructed
# execute unless block ~ ~ ~ #lockdown:passthrough run say stopped due to obstruction
execute unless block ~ ~ ~ #lockdown:passthrough run return 0

# Stop if we've hit the maximum number of attempts
# execute if score lockdown.attempts lockdown.local > @s lockdown.firing_range run say stop due to max attempts
execute if score lockdown.attempts lockdown.local > @s lockdown.firing_range run return 0

# Stop if beam hit entity
# execute as @e[dx=0,dy=0,dz=0,tag=!lockdown.turret.hit_exception,type=!#lockdown:laser_ignore] run say hit entity
execute if entity @s[tag=lockdown.behavior.flamethrower] as @e[dx=0,dy=0,dz=0,tag=!lockdown.turret.hit_exception,type=!#lockdown:laser_ignore] run return run function lockdown:devices/turret/fire/impact_flamethrower with storage lockdown:temp args
execute if entity @s[tag=!lockdown.behavior.flamethrower] as @e[dx=0,dy=0,dz=0,tag=!lockdown.turret.hit_exception,type=!#lockdown:laser_ignore] run return run function lockdown:devices/turret/fire/impact_normal with storage lockdown:temp args

# Increment position and try again
execute positioned ^ ^ ^1 run return run function lockdown:devices/turret/fire/raycast_loop


