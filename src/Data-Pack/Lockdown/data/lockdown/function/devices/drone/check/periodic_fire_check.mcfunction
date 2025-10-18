# This function is used by lockdown:devices/drone/attacking/root to determine
# if it's time to fire the laser

# Time check
execute store result score lockdown.timestamp lockdown.local run time query gametime
scoreboard players operation lockdown.timestamp lockdown.local %= lockdown.drone_fire_interval lockdown.constant
execute unless score lockdown.timestamp lockdown.local matches 0 run return 0

# All checks passed
return 1
