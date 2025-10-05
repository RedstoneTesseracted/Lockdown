# This function is used to flag an entity as a potential "enemy".
# The enemy is assigned a priority score used to help determine
# which one a drone should attack next (if applicable)
#
# The priority score is assigned based on the following:
# * Players take higher priority
# * Closer entities take higher priority
# * Holding a weapon increases priority
#
# This is run BY the enemy entity

scoreboard players set @s lockdown.drone.target_priority 0

# Player priority bonus
execute if entity @s[type=minecraft:player] run scoreboard players add @s lockdown.drone.target_priority 200

# Holding weapon bonus
execute if predicate lockdown:holding_weapon run scoreboard players add @s lockdown.drone.target_priority 50

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

# Grant tag to mark as enemy.  However, only bother if this priority is higher than any seen thus far
execute if score @s lockdown.drone.target_priority > lockdown.highest_priority lockdown.local run tag @s add lockdown.drone.enemy

# Record highest priority thus far
scoreboard players operation lockdown.highest_priority lockdown.local > @s lockdown.drone.target_priority
