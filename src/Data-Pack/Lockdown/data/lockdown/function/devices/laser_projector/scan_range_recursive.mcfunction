# Recursion-based loop initially called by ./scan_range to determine the maximum laser range

# Terminate if we've hit maximum range OR have hit a non-transparent block
execute if score lockdown.range lockdown.local > lockdown.max_laser_distance lockdown.constant run return 0
execute unless block ~ ~ ~ #lockdown:laser_transparent run return 1

# Increment the counter and run again
scoreboard players add lockdown.range lockdown.local 1
execute positioned ^ ^ ^1 run function lockdown:devices/laser_projector/scan_range_recursive
