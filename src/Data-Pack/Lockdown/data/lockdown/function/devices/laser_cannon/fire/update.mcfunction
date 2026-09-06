# This function progresses the cannon firing state.
# This is called every tick by lockdown:devices/laser_cannon/root while the cannon is firing.
# This is run BY and AT the root cannon entity

# On tick 1: interpolate beam to maximum size
execute if score @s lockdown.cannon.fire_state matches 2 on passengers if entity @s[tag=lockdown.laser_cannon.beam] run function lockdown:devices/laser_cannon/fire/expand_beam

# On tick 3: shrink beam
execute if score @s lockdown.cannon.fire_state matches 7 on passengers if entity @s[tag=lockdown.laser_cannon.beam] run function lockdown:devices/laser_cannon/fire/shrink_beam

# Advance firing state
scoreboard players add @s lockdown.cannon.fire_state 1

# End firing animation
execute if score @s lockdown.cannon.fire_state matches 10.. run function lockdown:devices/laser_cannon/fire/stop
