# Raycasting function used to determine if a clear line of sight exists between the turret and a target candidate
# This is run BY the target candidate, AT the turret

scoreboard players set lockdown.attempts lockdown.local 0
execute facing entity @s eyes run return run function lockdown:devices/turret/pick_target/__raycast_from_turret
