# This function is used to determine how far the laser can extend before being blocked.
# It calls a recursive function that checks subsequent blocks along the line of sight

# Reset counters
scoreboard players set lockdown.range lockdown.local 0

# Run recursive function to determine range
execute positioned ^ ^ ^1 run function lockdown:devices/laser_projector/scan_range_recursive

# Return the final result
return run scoreboard players get lockdown.range lockdown.local
