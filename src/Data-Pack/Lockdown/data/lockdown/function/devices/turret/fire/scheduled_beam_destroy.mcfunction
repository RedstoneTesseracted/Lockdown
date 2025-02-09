# This is a scheduled function that destroys old beam effects
execute as @e[tag=lockdown.turret.laser_beam] run function lockdown:devices/turret/fire/destroy_old_beam
