# Clears all tags that indicate a device is newly summoned
# Run after the individual placer functions

tag @e[tag=lockdown.block.display.new] remove lockdown.block.display.new
tag @e[tag=lockdown.block.root.new] remove lockdown.block.root.new
tag @e[tag=lockdown.block.hitbox.new] remove lockdown.block.hitbox.new
tag @e[tag=lockdown.alarm.glow.new] remove lockdown.alarm.glow.new
tag @e[tag=lockdown.force_field_projector.shield.new] remove lockdown.force_field_projector.shield.new
tag @e[tag=lockdown.laser_projector.beam.new] remove lockdown.laser_projector.beam.new
tag @e[tag=lockdown.block.interaction.new] remove lockdown.block.interaction.new

