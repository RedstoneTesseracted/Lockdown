# This function checks if an entity is within the drone's FOV
# This is run AT the drone's position, BY the entity to check


# Obtain unit vector of drone's camera
execute positioned 0.0 0.0 0.0 positioned ^ ^ ^1 summon minecraft:marker run function lockdown:devices/drone/check/__within_fov1

# Obtain unit vector from drone to entity
execute facing entity @s eyes positioned 0.0 0.0 0.0 positioned ^ ^ ^1 summon minecraft:marker run function lockdown:devices/drone/check/__within_fov2

# Compute dot product
scoreboard players operation lockdown.x1 lockdown.local *= lockdown.x2 lockdown.local
scoreboard players operation lockdown.y1 lockdown.local *= lockdown.y2 lockdown.local
scoreboard players operation lockdown.z1 lockdown.local *= lockdown.z2 lockdown.local
scoreboard players operation lockdown.x1 lockdown.local += lockdown.y1 lockdown.local
scoreboard players operation lockdown.x1 lockdown.local += lockdown.z1 lockdown.local

#tellraw @a [{selector: "@s"}, {text:": "}, {score: {name: "lockdown.x1", objective: "lockdown.local"}}]

# Is entity within -70° to 70° (i.e, dot product is in range [0.3420, 1.0000] for our precision)
execute if score lockdown.x1 lockdown.local matches 3420.. run return 1
return 0
