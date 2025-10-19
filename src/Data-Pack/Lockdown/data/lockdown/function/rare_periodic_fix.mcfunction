# Similar to lockdown:periodic_fix, but for lower-priority problems that need to be checked less-frequently

# Clean expired entities from drone's approval lists
execute as @e[tag=lockdown.block.root,tag=lockdown.drone] at @s run function lockdown:devices/drone/approval/clean

# Schedule this function to run again
schedule function lockdown:rare_periodic_fix 0.5d replace
