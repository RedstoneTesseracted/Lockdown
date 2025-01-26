# This function branches out to convert old-style lockdown machines to new-style ones

execute if entity @s[tag=ld_big_button] run function lockdown:legacy/machine/big_button
execute if entity @s[tag=ld_alarm] run function lockdown:legacy/machine/alarm
execute if entity @s[tag=ld_heavy_lever] run function lockdown:legacy/machine/heavy_lever
execute if entity @s[tag=ld_keypad] run function lockdown:legacy/machine/keypad
execute if entity @s[tag=ld_keycard_reader] run function lockdown:legacy/machine/keycard_reader
execute if entity @s[tag=ld_player_detector] run function lockdown:legacy/machine/player_detector
execute if entity @s[tag=ld_mob_detector] run function lockdown:legacy/machine/mob_detector
execute if entity @s[tag=ld_klaxon] run function lockdown:legacy/machine/klaxon
execute if entity @s[tag=ld_laser] run function lockdown:legacy/machine/laser
execute if entity @s[tag=ld_transmitter] run function lockdown:legacy/machine/transmitter
execute if entity @s[tag=ld_receiver] run function lockdown:legacy/machine/receiver
execute if entity @s[tag=ld_force_field] run function lockdown:legacy/machine/force_field
execute if entity @s[tag=ld_control_tower] run function lockdown:legacy/machine/control_tower
execute if entity @s[tag=ld_drone] run function lockdown:legacy/machine/drone
execute if entity @s[tag=ld_turret] run function lockdown:legacy/machine/turret
execute if entity @s[tag=ld_encoder] run function lockdown:legacy/machine/encoder
execute if entity @s[tag=ld_crafter] run function lockdown:legacy/machine/crafter

# Other special entities
#kill @e[type=minecraft:armor_stand,tag=ld_click_detector]
