# First execution context-switch used by within_fov

# Record position
execute store result score lockdown.x1 lockdown.local run data get entity @s Pos[0] 100.0
execute store result score lockdown.y1 lockdown.local run data get entity @s Pos[1] 100.0
execute store result score lockdown.z1 lockdown.local run data get entity @s Pos[2] 100.0

# Remove temporary marker entity
kill @s[type=minecraft:marker]
