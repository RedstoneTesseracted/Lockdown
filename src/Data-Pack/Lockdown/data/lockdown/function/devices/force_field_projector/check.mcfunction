# This function checks if there's enough space to spawn the force field

# Expected force field size
execute store result score lockdown.expected lockdown.local run function lockdown:devices/force_field_projector/get_expected_volume

# Count how many blocks we can actually replace with barriers
execute store result score lockdown.filled lockdown.local run function lockdown:devices/force_field_projector/fill/air_to_temporary
function lockdown:devices/force_field_projector/fill/temporary_to_air

# Did we replace the expected number of blocks?
execute if score lockdown.expected lockdown.local = lockdown.filled lockdown.local run return 1
return 0
