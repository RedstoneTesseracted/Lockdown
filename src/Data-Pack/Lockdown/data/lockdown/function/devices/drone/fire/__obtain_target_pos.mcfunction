execute store result score lockdown.drone.target.y2 lockdown.local run data get entity @s Pos[1] 100.0
#tellraw @a [{text: "Marker summoned at: "}, {nbt: "Pos[1]", entity: "@s"}]
kill @s[type=minecraft:marker]
