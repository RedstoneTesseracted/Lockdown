# Machine behavior-related commands
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_big_button] at @s positioned ~ ~0.23 ~ run function lockdown:devices/button/big_button
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_alarm] at @s positioned ~ ~0.23 ~ run function lockdown:devices/alarm/alarm
execute as @e[type=armor_stand,tag=ld_glow_effect] at @s run function lockdown:devices/alarm/alarm_shine_do
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_heavy_lever] at @s positioned ~ ~0.23 ~ run function lockdown:devices/lever/heavy_lever
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_keypad] at @s positioned ~ ~0.23 ~ run function lockdown:devices/keypad/keypad
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_keycard_reader] at @s positioned ~ ~0.23 ~ run function lockdown:devices/keycard/keycard_reader
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_player_detector] at @s positioned ~ ~0.23 ~ run function lockdown:devices/player_detector/player_detector
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_mob_detector] at @s positioned ~ ~0.23 ~ run function lockdown:devices/mob_detector/mob_detector
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_klaxon] at @s positioned ~ ~0.23 ~ run function lockdown:devices/klaxon/klaxon
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_laser] at @s positioned ~ ~0.23 ~ run function lockdown:devices/laser/laser
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_transmitter] at @s positioned ~ ~0.23 ~ run function lockdown:devices/transmitter/transmitter
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_receiver] at @s positioned ~ ~0.23 ~ run function lockdown:devices/receiver/receiver
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_force_field] at @s positioned ~ ~0.23 ~ run function lockdown:devices/force_field/force_field
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_control_tower] at @s positioned ~ ~0.23 ~ run function lockdown:devices/control_tower/control_tower
execute as @e[type=minecraft:armor_stand,tag=ld_drone] at @s positioned ~ ~ ~ run function lockdown:devices/drone/drone
execute as @e[type=minecraft:armor_stand,tag=ld_turret] at @s positioned ~ ~0.23 ~ run function lockdown:devices/turret/turret
execute as @e[type=minecraft:armor_stand,tag=ld_encoder] at @s positioned ~ ~0.23 ~ run function lockdown:devices/encoder/encoder

# Run upgrade-related commands
execute as @e[type=item,nbt={Item:{tag:{LockdownData:{upgrade:1b}}}}] at @s run function lockdown:upgrades/root

# Maintain custom block light level and invisibility
execute as @e[type=minecraft:armor_stand,tag=ld_block] run data modify entity @s Fire set value 1000000
effect give @e[tag=ld_invisible] minecraft:invisibility 1000000 1 true

# Reset some scores
execute at @a[scores={ld_use_noteblock=1..}] as @e[type=minecraft:armor_stand,tag=ld_force_field,limit=1,sort=nearest,distance=..5] at @s positioned ~ ~0.23 ~ run function lockdown:devices/force_field/outline
scoreboard players set @a ld_use_noteblock 0
