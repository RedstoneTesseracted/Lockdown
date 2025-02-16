# Scheduled function that runs every tick ONLY when a projectile entity exists

# Common projectile updates
execute as @e[tag=lockdown.projectile.root] run function lockdown:projectile/common_update

# Type-specific functions
execute as @e[tag=lockdown.projectile.root,tag=lockdown.laser] at @s run function lockdown:projectile/laser/root

# Run again if projectile exists
execute if entity @e[tag=lockdown.projectile.root] run schedule function lockdown:projectile/tick 1t replace
