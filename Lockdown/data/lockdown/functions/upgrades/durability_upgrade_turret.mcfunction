execute at @e[tag=ld_turret,distance=..1,limit=1,sort=nearest,tag=!ld_modified] run particle minecraft:happy_villager ~ ~1.0 ~ 0.3 0.3 0.3 0.25 7
execute at @e[tag=ld_turret,distance=..1,limit=1,sort=nearest,tag=!ld_modified] as @e[distance=..0.5,type=minecraft:bee,tag=ld_turret_hitbox,limit=1,sort=nearest] run attribute @s minecraft:generic.max_health base set 30.0
tag @e[tag=ld_turret,distance=..1,limit=1,sort=nearest,tag=!ld_modified] add ld_durable
tag @e[tag=ld_turret,distance=..1,limit=1,sort=nearest,tag=!ld_modified] add ld_modified
function lockdown:upgrades/generic_use
