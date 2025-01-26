# Common function used to set the directionality tag of a custom block
# It is run BY the new block root entity, and requires the direction
# score to be set.

execute if score lockdown.direction lockdown.local matches 0 run tag @s add lockdown.direction.up
execute if score lockdown.direction lockdown.local matches 1 run tag @s add lockdown.direction.down
execute if score lockdown.direction lockdown.local matches 2 run tag @s add lockdown.direction.north
execute if score lockdown.direction lockdown.local matches 3 run tag @s add lockdown.direction.south
execute if score lockdown.direction lockdown.local matches 4 run tag @s add lockdown.direction.west
execute if score lockdown.direction lockdown.local matches 5 run tag @s add lockdown.direction.east
