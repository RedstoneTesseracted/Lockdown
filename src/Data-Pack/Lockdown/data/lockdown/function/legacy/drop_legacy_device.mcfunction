# This function drops a pre-R3 legacy device in its modern R3 form
#
# This is run BY and AT the entity to upgrade

execute positioned ~ ~0.23 ~ if entity @s[tag=ld_big_button] run function lockdown:legacy/machine/big_button
execute positioned ~ ~0.23 ~ if entity @s[tag=ld_alarm] run function lockdown:legacy/machine/alarm
execute positioned ~ ~0.23 ~ if entity @s[tag=ld_heavy_lever] run function lockdown:legacy/machine/heavy_lever
execute positioned ~ ~0.23 ~ if entity @s[tag=ld_keypad] run function lockdown:legacy/machine/keypad
execute positioned ~ ~0.23 ~ if entity @s[tag=ld_keycard_reader] run function lockdown:legacy/machine/keycard_reader
execute positioned ~ ~0.23 ~ if entity @s[tag=ld_player_detector] run function lockdown:legacy/machine/player_detector
execute positioned ~ ~0.23 ~ if entity @s[tag=ld_mob_detector] run function lockdown:legacy/machine/mob_detector
execute positioned ~ ~0.23 ~ if entity @s[tag=ld_klaxon] run function lockdown:legacy/machine/klaxon
execute positioned ~ ~0.23 ~ if entity @s[tag=ld_laser] run function lockdown:legacy/machine/laser
execute positioned ~ ~0.23 ~ if entity @s[tag=ld_transmitter] run function lockdown:legacy/machine/transmitter
execute positioned ~ ~0.23 ~ if entity @s[tag=ld_receiver] run function lockdown:legacy/machine/receiver
execute positioned ~ ~0.23 ~ if entity @s[tag=ld_force_field] run function lockdown:legacy/machine/force_field
execute positioned ~ ~0.23 ~ if entity @s[tag=ld_control_tower] run function lockdown:legacy/machine/control_tower
execute positioned ~ ~0.23 ~ if entity @s[tag=ld_drone] run function lockdown:legacy/machine/drone
execute positioned ~ ~ ~ if entity @s[tag=ld_turret] run function lockdown:legacy/machine/turret
execute positioned ~ ~0.23 ~ if entity @s[tag=ld_encoder] run function lockdown:legacy/machine/encoder
execute positioned ~ ~0.23 ~ if entity @s[tag=ld_crafter] run function lockdown:legacy/machine/crafter

return 1
