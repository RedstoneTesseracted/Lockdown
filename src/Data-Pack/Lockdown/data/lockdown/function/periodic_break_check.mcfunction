# This function periodically checks if certain custom blocks still have
# a surface to mount to (e.x.: alarms, buttons).
# If they don't, said custom blocks will be broken

execute as @e[tag=lockdown.behavior.wall_mounted] at @s run function lockdown:devices/destroy_unmounted
schedule function lockdown:periodic_break_check 2s replace
