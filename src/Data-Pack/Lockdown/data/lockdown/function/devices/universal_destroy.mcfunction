# This function is capable of destroying any custom lockdown block/entity.
# It works by running the corresponding block destruction function that
# matches whatever this entity is.
# This is run BY and AT the root block entity
# WARNING: THIS IS AUTO-GENERATED USING A SCRIPT

execute if entity @s[tag=lockdown.alarm] run return run function lockdown:devices/alarm/destroy
execute if entity @s[tag=lockdown.big_button] run return run function lockdown:devices/big_button/destroy
execute if entity @s[tag=lockdown.control_tower] run return run function lockdown:devices/control_tower/destroy
execute if entity @s[tag=lockdown.encoder] run return run function lockdown:devices/encoder/destroy
execute if entity @s[tag=lockdown.force_field_projector] run return run function lockdown:devices/force_field_projector/destroy
execute if entity @s[tag=lockdown.keycard_reader] run return run function lockdown:devices/keycard_reader/destroy
execute if entity @s[tag=lockdown.klaxon] run return run function lockdown:devices/klaxon/destroy
execute if entity @s[tag=lockdown.laser_projector] run return run function lockdown:devices/laser_projector/destroy
execute if entity @s[tag=lockdown.mob_detector] run return run function lockdown:devices/mob_detector/destroy
execute if entity @s[tag=lockdown.player_detector] run return run function lockdown:devices/player_detector/destroy
execute if entity @s[tag=lockdown.turret] run return run function lockdown:devices/turret/destroy
execute if entity @s[tag=lockdown.wireless_receiver] run return run function lockdown:devices/wireless_receiver/destroy
execute if entity @s[tag=lockdown.wireless_transmitter] run return run function lockdown:devices/wireless_transmitter/destroy
