# Checks if current entity is a drone and returns the result

execute if entity @s[tag=lockdown.drone] run return 1
return 0
