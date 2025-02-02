# The root keycard reader function

# Check for nearby players w/ keycard
tag @s remove lockdown.detected
execute if function lockdown:devices/keycard_reader/scan run tag @s add lockdown.detected

# Update state if needed
execute if entity @s[tag=lockdown.powered,tag=!lockdown.detected] run function lockdown:devices/keycard_reader/revoke_access
execute if entity @s[tag=!lockdown.powered,tag=lockdown.detected] run function lockdown:devices/keycard_reader/grant_access
execute unless block ~ ~ ~ #lockdown:redstone_output run function lockdown:devices/keycard_reader/destroy
