execute at @e[tag=ld_drone,distance=..1,limit=1,sort=nearest,tag=!ld_modified] run particle minecraft:happy_villager ~ ~ ~ 0.3 0.3 0.3 0.25 5
tag @e[tag=ld_drone,distance=..1,limit=1,sort=nearest,tag=!ld_modified] add ld_flamethrower
tag @e[tag=ld_drone,distance=..1,limit=1,sort=nearest,tag=!ld_modified] add ld_modified
function lockdown:upgrades/generic_use
