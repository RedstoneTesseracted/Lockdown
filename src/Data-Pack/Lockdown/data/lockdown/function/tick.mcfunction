# Machine behavior-related commands
execute as @e[tag=lockdown.block.root,tag=lockdown.big_button] at @s run function lockdown:devices/big_button/root
execute as @e[tag=lockdown.block.root,tag=lockdown.alarm] at @s run function lockdown:devices/alarm/root
execute as @e[tag=lockdown.block.root,tag=lockdown.keycard_reader] at @s run function lockdown:devices/keycard_reader/root
execute as @e[tag=lockdown.block.root,tag=lockdown.player_detector] at @s run function lockdown:devices/player_detector/root
execute as @e[tag=lockdown.block.root,tag=lockdown.mob_detector] at @s run function lockdown:devices/mob_detector/root
execute as @e[tag=lockdown.block.root,tag=lockdown.klaxon] at @s run function lockdown:devices/klaxon/root
execute as @e[tag=lockdown.block.root,tag=lockdown.laser_projector] at @s run function lockdown:devices/laser_projector/root
execute as @e[tag=lockdown.block.root,tag=lockdown.wireless_transmitter] at @s run function lockdown:devices/wireless_transmitter/root
execute as @e[tag=lockdown.block.root,tag=lockdown.wireless_receiver] at @s run function lockdown:devices/wireless_receiver/root
execute as @e[tag=lockdown.block.root,tag=lockdown.force_field_projector] at @s run function lockdown:devices/force_field_projector/root
execute as @e[tag=lockdown.block.root,tag=lockdown.control_tower] at @s run function lockdown:devices/control_tower/root
execute as @e[tag=lockdown.block.root,tag=lockdown.drone] at @s run function lockdown:devices/drone/root
execute as @e[tag=lockdown.block.root,tag=lockdown.turret] at @s run function lockdown:devices/turret/root
execute as @e[tag=lockdown.block.root,tag=lockdown.encoder] at @s run function lockdown:devices/encoder/root


# Right-clickable items
execute as @a[scores={lockdown.use_carrot_on_a_stick=1..}] at @s run function lockdown:items/click_callback
