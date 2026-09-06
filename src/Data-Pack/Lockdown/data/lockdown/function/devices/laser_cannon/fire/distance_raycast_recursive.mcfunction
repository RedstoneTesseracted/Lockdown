# Recursive raycast called by lockdown:devices/laser_cannon/fire/distance_raycast
# Halts if solid block is detected.
# Does NOT stop for entities

scoreboard players add lockdown.distance lockdown.local 1
execute if block ~ ~ ~ #lockdown:laser_transparent if score lockdown.distance lockdown.local < lockdown.cannon_max_range lockdown.constant positioned ^ ^ ^1 run function lockdown:devices/laser_cannon/fire/distance_raycast_recursive
