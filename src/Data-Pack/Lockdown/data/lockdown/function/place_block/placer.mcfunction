# This function handles the conversion of a lockdown device placer entity into the
# corresponding device.  It branches out depending on what type of placer this is
# (indicated by a scoreboard tag)
# It is run BY and AT placer entities

# Safety check
function lockdown:place_block/place/common_new_clear

execute if entity @s[tag=lockdown.placer.keycard_reader] run function lockdown:place_block/place/keycard_reader
execute if entity @s[tag=lockdown.placer.alarm] run function lockdown:place_block/place/alarm
execute if entity @s[tag=lockdown.placer.big_button] run function lockdown:place_block/place/big_button
execute if entity @s[tag=lockdown.placer.drone] run function lockdown:place_block/place/drone
execute if entity @s[tag=lockdown.placer.player_detector] run function lockdown:place_block/place/player_detector
execute if entity @s[tag=lockdown.placer.mob_detector] run function lockdown:place_block/place/mob_detector
execute if entity @s[tag=lockdown.placer.klaxon] run function lockdown:place_block/place/klaxon
execute if entity @s[tag=lockdown.placer.laser_projector] run function lockdown:place_block/place/laser_projector
execute if entity @s[tag=lockdown.placer.wireless_transmitter] run function lockdown:place_block/place/wireless_transmitter
execute if entity @s[tag=lockdown.placer.wireless_receiver] run function lockdown:place_block/place/wireless_receiver
execute if entity @s[tag=lockdown.placer.force_field_projector] run function lockdown:place_block/place/force_field_projector
execute if entity @s[tag=lockdown.placer.turret] run function lockdown:place_block/place/turret
execute if entity @s[tag=lockdown.placer.encoder] run function lockdown:place_block/place/encoder

# Set pack version at creation
function lockdown:place_block/place/common_version

# Clear all "new" statuses
function lockdown:place_block/place/common_new_clear

# Remove placer
kill @s[tag=lockdown.placer]
