# The root function for a recursive function that performs a raycast
# This exists so we can quickly grab the angles needed to orient the laser beam

# Perform the raycast
scoreboard players set lockdown.attempts lockdown.local 0
function lockdown:devices/turret/fire/raycast_loop

# Summon the temporary beam entity
execute align xyz positioned ~0.5 ~0.5 ~0.5 summon minecraft:item_display run function lockdown:devices/turret/fire/configure_beam
# execute summon minecraft:item_display run function lockdown:devices/turret/fire/configure_beam
