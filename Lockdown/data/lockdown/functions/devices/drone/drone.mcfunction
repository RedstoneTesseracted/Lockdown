# Destroy the drone, if possible
execute unless entity @e[type=minecraft:bee,tag=ld_drone_hitbox,distance=..1] run function lockdown:devices/drone/drone_destroy

# Warn unauthorized players of their impending doom, unless the drone is set to non-player only.
tag @a[tag=ld_channel_match] remove ld_channel_match
execute at @a[distance=..15] if score @s ld_channel = @p ld_last_channel run tag @p add ld_channel_match
execute if score @s ld_channel matches 0 run tag @a[distance=..10] add ld_channel_match
title @a[tag=!ld_channel_match,distance=..15,gamemode=!creative,gamemode=!spectator] actionbar {"text":"Warning: Your most recent keycard does not match.","color":"red"}

# Run timer-specific commands.
scoreboard players add @s ld_time 1
# Every 40 ticks attempt to...
# Fire the drone if a viable target is within two blocks
# Approach the nearest target within fifteen blocks if it was unable to fire
execute if score @s ld_time matches 40 run function lockdown:devices/drone/search
#execute if entity @s[tag=ld_drone_fire,tag=ld_drone_seek] run particle dust 0 0 1 1 ~ ~ ~ 0.2 0.2 0.2 0.5 4
execute if score @s ld_time matches 40 if entity @s[tag=ld_drone_fire] run function lockdown:devices/drone/drone_fire
execute if score @s ld_time matches 40 if entity @s[tag=ld_drone_seek] run function lockdown:devices/drone/drone_approach

# Halt the drone if it reaches its target before the timer has a chance to switch its mode
execute if entity @s[tag=ld_drone_seek] at @e[distance=0.1..3] if score @s ld_target_uuid1 = @e[limit=1,sort=nearest] ld_uuid1 at @s run data modify entity @e[type=minecraft:bee,tag=ld_drone_hitbox,distance=..1,limit=1,sort=nearest] NoAI set value 1b
# If the drone as attempting to fire, ensure that it is facing its target in case its AI has been disabled
execute if entity @s[tag=ld_drone_fire] as @e[distance=0.1..5] if score @e[limit=1,sort=nearest] ld_target_uuid1 = @s ld_uuid1 at @e[type=minecraft:bee,tag=ld_drone_hitbox,limit=1,sort=nearest] facing entity @s feet run tp @e[tag=ld_drone_hitbox,limit=1,sort=nearest] ~ ~ ~ ~ ~

# Rotate the armor stand to face the same direction as the bee
execute at @s rotated as @e[type=minecraft:bee,tag=ld_drone_hitbox,distance=..1,limit=1] run tp @s ~ ~ ~ ~ ~

# Reset the timer
execute if score @s ld_time matches 40.. run scoreboard players set @s ld_time 0

# Remove the target tag
tag @e[tag=ld_drone_target] remove ld_drone_target
