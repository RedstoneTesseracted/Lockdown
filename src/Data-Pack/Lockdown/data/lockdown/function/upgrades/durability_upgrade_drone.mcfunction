execute at @e[tag=ld_drone,distance=..1,limit=1,sort=nearest,tag=!ld_modified] run particle minecraft:happy_villager ~ ~ ~ 0.3 0.3 0.3 0.25 5
execute at @e[tag=ld_drone,distance=..1,limit=1,sort=nearest,tag=!ld_modified] as @e[distance=..1,type=minecraft:bee,tag=ld_drone_hitbox,limit=1,sort=nearest] run attribute @s minecraft:generic.max_health base set 30.0
tag @e[tag=ld_drone,distance=..1,limit=1,sort=nearest,tag=!ld_modified] add ld_durable
tag @e[tag=ld_drone,distance=..1,limit=1,sort=nearest,tag=!ld_modified] add ld_modified
function lockdown:upgrades/generic_use
