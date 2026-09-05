# This function runs every tick so long as a player is riding a laser cannon.
# This is mainly used to clear camera zoom out when a player unmounts a laser cannon
# It keeps itself running using /schedule

execute as @a[tag=lockdown.laser_cannon.is_riding] unless predicate lockdown:is_riding_cannon run function lockdown:devices/laser_cannon/mount/deactivate_player_mount
execute if entity @a[tag=lockdown.laser_cannon.is_riding] run schedule function lockdown:devices/laser_cannon/riding_tick 1t replace
