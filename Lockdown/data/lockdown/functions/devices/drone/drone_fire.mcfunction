playsound minecraft:entity.illusioner.prepare_mirror block @a ~ ~ ~ 0.5 2
scoreboard players set $ld_raycast_tries ld_raycast_tries 0

# Fire at target entity
execute as @e[tag=ld_drone_target,limit=1,sort=nearest,distance=..15] facing entity @s feet run function lockdown:devices/drone/drone_fire_recursive
