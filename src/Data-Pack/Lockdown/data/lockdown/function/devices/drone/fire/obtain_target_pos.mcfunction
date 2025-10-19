# This function is used to compute the position to fire at
# This is run BY the drone hitbox entity
#
# We add the target's motion as well to try and predict 
# their future position.  A few notes with this:
#   * Grounded entities typically have a non-zero y-velocity.
#     So, we must ignore the y-velocity of grounded entities.
#   * The distance to the target affects how much we need
#     to compensate for motion.

# Calculate y-pos using midpoint between feet and eyes anchor
execute on target store result score lockdown.drone.target.y lockdown.local run data get entity @s Pos[1] 100.0
execute on target at @s anchored eyes positioned ^ ^ ^ run execute summon minecraft:marker run function lockdown:devices/drone/fire/__obtain_target_pos
scoreboard players operation lockdown.drone.target.y lockdown.local += lockdown.drone.target.y2 lockdown.local
scoreboard players operation lockdown.drone.target.y lockdown.local /= 2 lockdown.number

# Obtain target motion
#execute on target store result score lockdown.drone.target.vx lockdown.local run data get entity @s Motion[0] 1500.0
#execute on target unless predicate lockdown:is_on_ground store result score lockdown.drone.target.vy lockdown.local run data get entity @s Motion[1] 1500.0
#execute on target if predicate lockdown:is_on_ground run scoreboard players set lockdown.drone.target.vy lockdown.local 0
#execute on target store result score lockdown.drone.target.vz lockdown.local run data get entity @s Motion[2] 1500.0

execute on target store result score lockdown.drone.target.vx lockdown.local run data get entity @s Motion[0] 100.0
execute on target unless predicate lockdown:is_on_ground store result score lockdown.drone.target.vy lockdown.local run data get entity @s Motion[1] 100.0
execute on target if predicate lockdown:is_on_ground run scoreboard players set lockdown.drone.target.vy lockdown.local 0
execute on target store result score lockdown.drone.target.vz lockdown.local run data get entity @s Motion[2] 100.0

# Scale the motion compensation based on distance to the target
execute store result score lockdown.distance_multiplier lockdown.local run function lockdown:devices/drone/fire/lookup_distance_multiplier
scoreboard players operation lockdown.drone.target.vx lockdown.local *= lockdown.distance_multiplier lockdown.local
scoreboard players operation lockdown.drone.target.vy lockdown.local *= lockdown.distance_multiplier lockdown.local
scoreboard players operation lockdown.drone.target.vz lockdown.local *= lockdown.distance_multiplier lockdown.local
scoreboard players operation lockdown.drone.target.vx lockdown.local /= 10 lockdown.number
scoreboard players operation lockdown.drone.target.vy lockdown.local /= 10 lockdown.number
scoreboard players operation lockdown.drone.target.vz lockdown.local /= 10 lockdown.number

# Apply motion compensation to target position
execute on target store result score lockdown.drone.target.x lockdown.local run data get entity @s Pos[0] 100.0
execute on target store result score lockdown.drone.target.z lockdown.local run data get entity @s Pos[2] 100.0
scoreboard players operation lockdown.drone.target.x lockdown.local += lockdown.drone.target.vx lockdown.local
scoreboard players operation lockdown.drone.target.y lockdown.local += lockdown.drone.target.vy lockdown.local
scoreboard players operation lockdown.drone.target.z lockdown.local += lockdown.drone.target.vz lockdown.local

#tellraw @a [{text: "vx: "}, {score: {name: "lockdown.drone.target.vx", objective: "lockdown.local"}}, {text: ", vy: "}, {score: {name: "lockdown.drone.target.vy", objective: "lockdown.local"}}, {text: ", vz: "}, {score: {name: "lockdown.drone.target.vz", objective: "lockdown.local"}}]
#tellraw @a [{text: "x: "}, {score: {name: "lockdown.drone.target.x", objective: "lockdown.local"}}, {text: ", y: "}, {score: {name: "lockdown.drone.target.y", objective: "lockdown.local"}}, {text: ", z: "}, {score: {name: "lockdown.drone.target.z", objective: "lockdown.local"}}]

data modify storage lockdown:temp target_pos set value {x: 0, y: 0, z: 0}
execute store result storage lockdown:temp target_pos.x double 0.01 run scoreboard players get lockdown.drone.target.x lockdown.local
execute store result storage lockdown:temp target_pos.y double 0.01 run scoreboard players get lockdown.drone.target.y lockdown.local
execute store result storage lockdown:temp target_pos.z double 0.01 run scoreboard players get lockdown.drone.target.z lockdown.local

#execute on target run tellraw @a [{text: "Actual: "}, {nbt: "Pos", entity: "@s"}]
#tellraw @a [{text: "Adjusted: "}, {nbt: "target_pos", storage: "lockdown:temp"}]

