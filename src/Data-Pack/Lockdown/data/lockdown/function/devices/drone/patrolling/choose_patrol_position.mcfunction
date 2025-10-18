# This function picks a new position to check during the drone's patrol
# This is run BY and AT the root drone entity
#
# Positions are chosen in an empty space within 16 blocks (Manhattan
# distance) of the drone's home position.

# Pick a new block position
execute store result score lockdown.block.dx lockdown.local run random value -12..12
execute store result score lockdown.block.dy lockdown.local run random value -5..5
execute store result score lockdown.block.dz lockdown.local run random value -12..12

scoreboard players operation lockdown.block.x lockdown.local = @s lockdown.home.x
scoreboard players operation lockdown.block.y lockdown.local = @s lockdown.home.y
scoreboard players operation lockdown.block.z lockdown.local = @s lockdown.home.z

scoreboard players operation lockdown.block.x lockdown.local += lockdown.block.dx lockdown.local
scoreboard players operation lockdown.block.y lockdown.local += lockdown.block.dy lockdown.local
scoreboard players operation lockdown.block.z lockdown.local += lockdown.block.dz lockdown.local

#tellraw @a [{text: "x: "}, {score:{name:"lockdown.block.x",objective:"lockdown.local"}}, {text: ", y: "}, {score:{name:"lockdown.block.y",objective:"lockdown.local"}}, {text: ", z: "}, {score:{name:"lockdown.block.z",objective:"lockdown.local"}}]

# Check that position is valid.  If not, we'll try again next tick
data modify storage lockdown:temp candidate_pos set value {x: 0, y: 0, z: 0}
execute store result storage lockdown:temp candidate_pos.x int 1 run scoreboard players get lockdown.block.x lockdown.local
execute store result storage lockdown:temp candidate_pos.y int 1 run scoreboard players get lockdown.block.y lockdown.local
execute store result storage lockdown:temp candidate_pos.z int 1 run scoreboard players get lockdown.block.z lockdown.local
execute store result score lockdown.result lockdown.local run function lockdown:devices/drone/patrolling/__choose_patrol_position with storage lockdown:temp candidate_pos
execute if score lockdown.result lockdown.local matches 0 run return 0

# Update storage and scores
execute store result score @s lockdown.drone.choose_timestamp run time query gametime
scoreboard players set @s lockdown.drone.reach_timestamp 2147483647
tag @s add lockdown.drone.has_target

return 1
