# This function stores an entity's UUID in its scoreboard to make it easier for the
# turret to target it

execute store result score lockdown.target_uuid1 lockdown.local run data get entity @s UUID[0]
execute store result score lockdown.target_uuid2 lockdown.local run data get entity @s UUID[1]
execute store result score lockdown.target_uuid3 lockdown.local run data get entity @s UUID[2]
execute store result score lockdown.target_uuid4 lockdown.local run data get entity @s UUID[3]

scoreboard players operation @s lockdown.uuid1 = lockdown.target_uuid1 lockdown.local
scoreboard players operation @s lockdown.uuid2 = lockdown.target_uuid2 lockdown.local
scoreboard players operation @s lockdown.uuid3 = lockdown.target_uuid3 lockdown.local
scoreboard players operation @s lockdown.uuid4 = lockdown.target_uuid4 lockdown.local
