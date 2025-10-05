# Stores the chosen target's UUID in the bee and in scoreboards
# Run BY the drone's hitbox bee

execute on vehicle run data modify entity @s[type=minecraft:bee] AngryAt set from storage lockdown:temp chosen_uuid
data remove storage lockdown:temp chosen_uuid

execute on vehicle store result score @s lockdown.target_uuid1 run data get entity @s AngryAt[0]
execute on vehicle store result score @s lockdown.target_uuid2 run data get entity @s AngryAt[1]
execute on vehicle store result score @s lockdown.target_uuid3 run data get entity @s AngryAt[2]
execute on vehicle store result score @s lockdown.target_uuid4 run data get entity @s AngryAt[3]
