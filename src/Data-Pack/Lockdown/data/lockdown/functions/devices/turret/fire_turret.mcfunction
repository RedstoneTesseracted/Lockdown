scoreboard players set @s ld_raycast_tries 0
#particle dust 1 0 0 1 ~ ~ ~ 0.1 0.1 0.1 0 2
playsound minecraft:entity.illusioner.prepare_mirror block @a ~ ~ ~ 0.75 2

# Fire at entity, but do not fire at a player if their "last_channel" score matches
execute facing entity @e[type=#lockdown:hostile,tag=!ld_channel_match,limit=1,sort=nearest] feet run function lockdown:devices/turret/fire_turret_recursive
