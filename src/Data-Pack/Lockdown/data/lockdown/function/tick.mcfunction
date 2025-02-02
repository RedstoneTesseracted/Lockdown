# Machine behavior-related commands
execute as @e[tag=lockdown.block.root,tag=lockdown.big_button] at @s run function lockdown:devices/big_button/root
execute as @e[tag=lockdown.block.root,tag=lockdown.alarm] at @s run function lockdown:devices/alarm/root
# execute as @e[tag=lockdown.block.root,tag=lockdown.keycard_reader] at @s run function lockdown:devices/keycard_reader/root
execute as @e[tag=lockdown.block.root,tag=lockdown.player_detector] at @s run function lockdown:devices/player_detector/root
execute as @e[tag=lockdown.block.root,tag=lockdown.mob_detector] at @s run function lockdown:devices/mob_detector/root
execute as @e[tag=lockdown.block.root,tag=lockdown.klaxon] at @s run function lockdown:devices/klaxon/root
execute as @e[tag=lockdown.block.root,tag=lockdown.laser_projector] at @s run function lockdown:devices/laser_projector/root
execute as @e[tag=lockdown.block.root,tag=lockdown.wireless_transmitter] at @s run function lockdown:devices/wireless_transmitter/root
execute as @e[tag=lockdown.block.root,tag=lockdown.wireless_receiver] at @s run function lockdown:devices/wireless_receiver/root
execute as @e[tag=lockdown.block.root,tag=lockdown.force_field_projector] at @s run function lockdown:devices/force_field_projector/root
execute as @e[tag=lockdown.block.root,tag=lockdown.control_tower] at @s run function lockdown:devices/control_tower/root
# execute as @e[tag=lockdown.drone.root] at @s positioned ~ ~ ~ run function lockdown:devices/drone/drone
# execute as @e[tag=lockdown.turret.root] at @s run function lockdown:devices/turret/turret
execute as @e[tag=lockdown.encoder.root] at @s run function lockdown:devices/encoder/root

# Run upgrade-related commands
# execute as @e[type=item,nbt={Item:{tag:{LockdownData:{upgrade:1b}}}}] at @s run function lockdown:upgrades/root

# Maintain custom block light level and invisibility
# execute as @e[type=minecraft:armor_stand,tag=ld_block] run data modify entity @s Fire set value 1000000
# effect give @e[tag=ld_invisible] minecraft:invisibility 1000000 1 true

# Reset some scores
# execute at @a[scores={ld_use_noteblock=1..}] as @e[type=minecraft:armor_stand,tag=ld_force_field,limit=1,sort=nearest,distance=..5] at @s positioned ~ ~0.23 ~ run function lockdown:devices/force_field/outline
# scoreboard players set @a ld_use_noteblock 0
