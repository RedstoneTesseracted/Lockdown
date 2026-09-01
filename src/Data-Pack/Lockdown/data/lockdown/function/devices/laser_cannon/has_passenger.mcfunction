# This function returns whether the cannon is currently being ridden by anything
# This should be run BY the root cannon entity

execute on passengers if entity @s[tag=lockdown.laser_cannon.seat] on passengers run return 1
return 0
