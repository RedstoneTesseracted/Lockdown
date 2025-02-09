# Recursion-based loop that handles the raycasting

scoreboard players add lockdown.attempts lockdown.local 1

# Exit if we've reached maximum allowed attempts
execute if score lockdown.attempts lockdown.local matches 50.. run return 0

# Exit if we've reached target without obstruction
execute if entity @s[dx=1,dy=1,dz=1] run return 1

# Exit if we've hit obstruction
execute unless block ~ ~ ~ #lockdown:passthrough run return 0

# Increment forward and try again
execute facing entity @s eyes positioned ^ ^ ^1 run return run function lockdown:devices/turret/pick_target/__raycast_from_turret
