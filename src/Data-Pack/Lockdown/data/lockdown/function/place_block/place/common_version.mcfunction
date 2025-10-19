# Clears all tags that indicate a device is newly summoned
# Run after the individual placer functions

scoreboard players operation @e[tag=lockdown.block.display.new] lockdown.creation_version = lockdown.pack_version lockdown.constant
scoreboard players operation @e[tag=lockdown.block.root.new] lockdown.creation_version = lockdown.pack_version lockdown.constant
scoreboard players operation @e[tag=lockdown.block.hitbox.new] lockdown.creation_version = lockdown.pack_version lockdown.constant
scoreboard players operation @e[tag=lockdown.alarm.glow.new] lockdown.creation_version = lockdown.pack_version lockdown.constant
scoreboard players operation @e[tag=lockdown.force_field_projector.shield.new] lockdown.creation_version = lockdown.pack_version lockdown.constant
scoreboard players operation @e[tag=lockdown.laser_projector.beam.new] lockdown.creation_version = lockdown.pack_version lockdown.constant
scoreboard players operation @e[tag=lockdown.block.interaction.new] lockdown.creation_version = lockdown.pack_version lockdown.constant

