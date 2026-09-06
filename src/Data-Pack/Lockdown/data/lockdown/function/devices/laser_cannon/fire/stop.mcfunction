# This function ends the beam firing status of the cannon.
# This is called BY and AT the root cannon entity

# Delete beam entity
execute on passengers if entity @s[tag=lockdown.laser_cannon.beam] run kill @s

# Reset state score
scoreboard players set @s lockdown.cannon.fire_state 0
