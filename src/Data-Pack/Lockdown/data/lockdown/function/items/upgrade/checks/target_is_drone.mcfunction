# Checks if the entity marked by the "lockdown.context" tag is a drone and returns the result

execute as @e[tag=lockdown.context,limit=1] if entity @s[tag=lockdown.drone] run return 1
return 0
