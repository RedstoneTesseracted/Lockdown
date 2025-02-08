# Modify the bee/hitbox nbt so that it will pathfind to the target
data merge entity @e[type=minecraft:bee,tag=ld_drone_hitbox,distance=..1,limit=1,sort=nearest] {AngryAt:[I;0,0,0,0],AngerTime:1000000,HasStung:0b,NoAI:0b}
data modify entity @e[type=minecraft:bee,tag=ld_drone_hitbox,distance=..1,limit=1,sort=nearest] AngryAt set from entity @e[tag=ld_drone_target,limit=1,sort=nearest,distance=..15] UUID
