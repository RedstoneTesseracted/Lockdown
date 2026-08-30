# This function is used to check if the player interacted with a particular interaction entity

# Check timestamp
execute store result score lockdown.last_interaction_time lockdown.local run data get entity @s interaction.timestamp
execute unless score lockdown.gametime lockdown.local = lockdown.last_interaction_time lockdown.local run return 0

# Check player
execute on target if entity @s[tag=lockdown.context.source] run return 1
return 0
