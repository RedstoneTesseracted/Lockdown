# Stores the chosen target's UUID in the bee and in scoreboards
# Run BY the drone's hitbox bee

data modify entity @s[type=minecraft:bee] AngryAt set from entity @n[tag=lockdown.drone.candidate] UUID

execute store result score @s lockdown.target_uuid1 run data get entity @s AngryAt[0]
execute store result score @s lockdown.target_uuid2 run data get entity @s AngryAt[1]
execute store result score @s lockdown.target_uuid3 run data get entity @s AngryAt[2]
execute store result score @s lockdown.target_uuid4 run data get entity @s AngryAt[3]
