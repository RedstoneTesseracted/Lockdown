# This function returns whether the executing entity is targetable by berserker drones

# Hostile mobs will not be targeted
execute if entity @s[type=#lockdown:hostile] run return 0

# Other turrets/drones with a matching channel will not be targeted
execute if entity @s[tag=lockdown.behavior.code_hostile] if predicate lockdown:local_channel_matches run return 0

# Assume targetable
return 1
