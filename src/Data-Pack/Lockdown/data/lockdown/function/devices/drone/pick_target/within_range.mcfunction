# Function macro that selects targets within range
# Called from lockdown:devices/drone/pick BY the drone base entity

# Hostile mobs are ALWAYS included
$tag @e[type=#lockdown:hostile,distance=..$(range)] add lockdown.drone.candidate

# Turrets, drones, and players with a non-matching channel are included UNLESS this drone's channel is zero
execute if score @s lockdown.channel matches 0 run return 0
scoreboard players operation lockdown.channel lockdown.local = @s lockdown.channel
$execute as @e[tag=lockdown.behavior.code_hostile,distance=..$(range)] unless score @s lockdown.channel = lockdown.channel lockdown.local run tag @s add lockdown.drone.candidate
$execute as @a[distance=..$(range)] unless score @s lockdown.held_channel = lockdown.channel lockdown.local run tag @s add lockdown.drone.candidate
