# The root function for a recursive function that performs a raycast.
# This exists so we can quickly grab the angles needed to orient the laser beam.
# It is run BY and AT the turret base entity, FACING the target

# Perform the raycast
scoreboard players set lockdown.attempts lockdown.local 0
function lockdown:devices/turret/fire/raycast_loop

# Update the visual beam
execute on passengers if entity @s[tag=lockdown.turret.beam] run function lockdown:devices/turret/fire/configure_beam
