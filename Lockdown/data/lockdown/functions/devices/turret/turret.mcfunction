# Warn unauthorized players of their impending doom, unless the turret is set to non-player only.
execute as @a[distance=..15] run function lockdown:devices/turret/check_channel

# Destroy the turret if applicable
execute if block ~ ~-1 ~ #lockdown:passthrough run kill @e[distance=..0.5,type=minecraft:bee,tag=ld_turret_hitbox]
execute unless entity @e[distance=..0.5,type=minecraft:bee,tag=ld_turret_hitbox] run function lockdown:devices/turret/turret_destroy

# Run timer-specific commands.  Every 30 ticks attempt to fire the turret.
scoreboard players add @s ld_time 1
execute if score @s ld_time matches 30 if entity @e[type=#lockdown:hostile,tag=!ld_channel_match,distance=..15] at @e[distance=..1,type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_turret_blaster] positioned ~ ~0.75 ~ run function lockdown:devices/turret/fire_attempt
execute as @e[distance=..0.5,type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_turret_blaster] at @s facing entity @e[distance=..15,type=#lockdown:hostile,tag=!ld_channel_match,limit=1,sort=nearest] feet run tp @s ~ ~ ~ ~ ~
execute if score @s ld_time matches 30.. run scoreboard players set @s ld_time 0
