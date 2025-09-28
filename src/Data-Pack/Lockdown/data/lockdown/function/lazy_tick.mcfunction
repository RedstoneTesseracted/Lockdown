# Some functions only run EVERY tick under special conditions.
# This scheduled function periodically checks if they need to be reactivated using /schedule

# Re-activate lazy tick functions if needed
execute if entity @e[tag=lockdown.projectile] run schedule function lockdown:projectile/tick 1t replace

# Schedule to run again
schedule function lockdown:lazy_tick 10t replace
