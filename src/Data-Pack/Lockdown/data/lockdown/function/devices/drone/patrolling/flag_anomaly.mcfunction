# This function flags an anomaly for investigation

scoreboard players set @s lockdown.drone.target_priority 0

# Player priority bonus
execute if entity @s[type=minecraft:player] run scoreboard players add @s lockdown.drone.target_priority 200

# Compute squared-distance to drone (note: this depends on certain variables being converted to scores outside this function)
# Entities further away will take lower priority
execute store result score lockdown.x2 lockdown.local run data get entity @s Pos[0]
execute store result score lockdown.y2 lockdown.local run data get entity @s Pos[1]
execute store result score lockdown.z2 lockdown.local run data get entity @s Pos[2]
scoreboard players operation lockdown.x2 lockdown.local -= lockdown.drone.x lockdown.local
scoreboard players operation lockdown.y2 lockdown.local -= lockdown.drone.y lockdown.local
scoreboard players operation lockdown.z2 lockdown.local -= lockdown.drone.z lockdown.local
scoreboard players operation lockdown.x2 lockdown.local *= lockdown.x2 lockdown.local
scoreboard players operation lockdown.y2 lockdown.local *= lockdown.y2 lockdown.local
scoreboard players operation lockdown.z2 lockdown.local *= lockdown.z2 lockdown.local
scoreboard players operation lockdown.x2 lockdown.local += lockdown.y2 lockdown.local
scoreboard players operation lockdown.x2 lockdown.local += lockdown.z2 lockdown.local
scoreboard players operation @s lockdown.drone.target_priority -= lockdown.x2 lockdown.local

# If this priority is the highest seen so far, note the position
# Once all anomalies have been evaluated, the marked position will be the highest-priority one
execute if score @s lockdown.drone.target_priority > lockdown.highest_priority lockdown.local run function lockdown:devices/drone/patrolling/flag_position

# Record highest priority thus far
scoreboard players operation lockdown.highest_priority lockdown.local > @s lockdown.drone.target_priority

# Priority score no longer needed at this point
scoreboard players reset @s lockdown.drone.target_priority
