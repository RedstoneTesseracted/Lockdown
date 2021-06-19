# Target the nearest available potential target
tag @a remove ld_drone_targeted
# Target rival drones
#execute at @e[tag=ld_drone_hitbox,distance=..15] unless score @s ld_channel = @e[tag=ld_drone,limit=1,sort=nearest,distance=..1] ld_channel run tag @e[tag=ld_drone_hitbox,limit=1,sort=nearest] add ld_channel_rival
#tag @e[tag=ld_channel_rival,distance=..15,sort=nearest,limit=1] add ld_drone_target
#execute unless entity @e[tag=ld_channel_rival,distance=..15] run tag @e[type=#lockdown:hostile,tag=!ld_channel_match,distance=..15,sort=nearest,limit=1,gamemode=!creative,gamemode=!spectator] add ld_drone_target
tag @e[type=#lockdown:hostile,tag=!ld_channel_match,distance=..15] add ld_drone_potential_target
tag @a[tag=ld_drone_potential_target,gamemode=creative] remove ld_drone_potential_target
tag @a[tag=ld_drone_potential_target,gamemode=spectator] remove ld_drone_potential_target
tag @e[tag=ld_drone_potential_target,distance=..15,sort=nearest,limit=1] add ld_drone_target
tag @e[tag=ld_drone_potential_target,distance=..15,sort=nearest,limit=1] remove ld_drone_potential_target


# If said target is within five blocks, the drone may be able to fire at it
tag @s remove ld_drone_fire
tag @s remove ld_drone_seek
execute if entity @e[tag=ld_drone_target,distance=..5] run tag @s add ld_drone_fire

# Check if target is blocked.  If it is, cancel the attempt to fire and allow pathfinding to take effect
execute as @e[tag=ld_drone_target,distance=..5] facing entity @s feet run function lockdown:devices/drone/check_target
execute unless entity @e[tag=ld_drone_target,tag=ld_drone_confirmed,distance=..5] run tag @s remove ld_drone_fire
execute unless entity @e[tag=ld_drone_target,tag=ld_drone_confirmed,distance=..3] if entity @e[tag=ld_drone_target,distance=3..15] run tag @s add ld_drone_seek
#execute if entity @e[tag=ld_drone_target,distance=..3] unless entity @e[tag=ld_drone_target,distance=..3,tag=ld_drone_confirmed] run tag @s add ld_drone_seek

# If no target was founnd within three blocks to begin with, pathfind to the nearest target within 4-15 blocks away
#execute unless entity @e[tag=ld_drone_target,distance=..3] if entity @e[tag=ld_drone_target,distance=3..15] run tag @s add ld_drone_seek

# If no target was found at all, ensure that the drone has been halted
execute unless entity @e[tag=ld_drone_target,distance=..15] run data modify entity @e[type=minecraft:bee,tag=ld_drone_hitbox,distance=..1,limit=1,sort=nearest] NoAI set value 1b
#execute unless entity @e[tag=ld_drone_target,distance=..15] run particle dust 0 1 0 1 ~ ~ ~ 0.2 0.2 0.2 0.5 4

# Finish setting status tags
tag @e[tag=ld_drone_confirmed] remove ld_drone_confirmed
#tag @e[tag=ld_channel_rival] remove ld_channel_rival
#tag @e[tag=ld_drone_target] add ld_drone_targeted

# Store the target's UUID so the drone knows which entity it is targeting
execute as @e[tag=ld_drone_target] store result score @s ld_uuid1 run data get entity @s UUID[0]
execute as @e[tag=ld_drone_target] store result score @e[tag=ld_drone,limit=1,sort=nearest] ld_target_uuid1 run data get entity @s UUID[0]

# Indicate the drone's hostility
execute if entity @e[tag=ld_drone_target,distance=..15] if entity @s[tag=!ld_drone_hostile] run function lockdown:devices/drone/hostile
execute unless entity @e[tag=ld_drone_target,distance=..15] if entity @s[tag=ld_drone_hostile] run function lockdown:devices/drone/normal
