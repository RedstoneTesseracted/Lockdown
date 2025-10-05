# This function handles picking the enemy with the highest priority as the drone's next target
#
# This also cleans up the lockdown.drone.enemy tag and the lockdown.drone.target_priority score

# Unset tags
tag @s remove lockdown.drone.enemy

# Skip if a higher priority enemy exists or was already chosen
execute if score lockdown.found_highest lockdown.local matches 1 run return run scoreboard players reset @s lockdown.drone.target_priority
execute if score lockdown.highest_priority lockdown.local > @s lockdown.drone.target_priority run return run scoreboard players reset @s lockdown.drone.target_priority

# Choose this enemy as the highest-priority target
data modify storage lockdown:temp chosen_uuid set from entity @s UUID
scoreboard players reset @s lockdown.drone.target_priority

# Inform other instances of this function that there's no need to do additional processing
scoreboard players set lockdown.found_highest lockdown.local 0
