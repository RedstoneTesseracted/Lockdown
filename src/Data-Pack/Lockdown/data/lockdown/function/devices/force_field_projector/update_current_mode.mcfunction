# This function updates the "current mode" score of the force
# field projector and returns whether a change occurred.
#
# This is run BY and AT the base force field projector entity.

# Get current value
scoreboard players operation lockdown.current_mode lockdown.local = @s lockdown.current_mode

# Set new value
execute store result score @s lockdown.current_mode run function lockdown:devices/force_field_projector/mode_from_block_state

# Return whether value changed
execute if score @s lockdown.current_mode = lockdown.current_mode lockdown.local run return 0
return 1
