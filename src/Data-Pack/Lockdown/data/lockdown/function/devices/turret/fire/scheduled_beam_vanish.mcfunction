# This is a scheduled function that vanishes old beam effects

execute as @e[tag=lockdown.turret.beam] run function lockdown:devices/turret/fire/vanish_old_beam
