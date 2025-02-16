# Checks if the entity marked by the "lockdown.context" tag is a turret and returns the result

execute as @e[tag=lockdown.context,limit=1] if entity @s[tag=lockdown.turret] run return 1
return 0
