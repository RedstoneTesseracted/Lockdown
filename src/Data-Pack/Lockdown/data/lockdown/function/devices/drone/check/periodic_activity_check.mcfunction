# This function is used by lockdown:devices/drone/patrolling/root to determine
# if it's time to run a check for suspicious activity on nearby entities

# Time check
execute store result score lockdown.timestamp lockdown.local run time query gametime
scoreboard players operation lockdown.timestamp lockdown.local %= lockdown.drone_suspect_interval lockdown.constant
execute unless score lockdown.timestamp lockdown.local matches 0 run return 0

# Don't bother if there's nothing around
execute unless entity @e[distance=0.1..24,type=!#lockdown:drone_ignore] run return 0

# All checks passed
return 1
