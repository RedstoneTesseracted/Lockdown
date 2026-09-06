# This function returns whether the cannon is currently charging

execute on passengers if entity @s[tag=lockdown.laser_cannon.seat] on passengers if predicate lockdown:is_pressing_space run return 1
return 0
