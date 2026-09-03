# This function is used by lockdown:devices/hit_destroy_callback to check if the player is riding the entity they tried to destroy
# The entity that COULD be destroyed is tagged with lockdown.context

# Manually handle several cases where entities might be stacked together.
# This is most relevant for the laser cannon, where the entity the player hits is different from the entity the player is riding.
execute on vehicle if entity @s[tag=lockdown.context] run return 1
execute on vehicle on passengers if entity @s[tag=lockdown.context] run return 1
execute on vehicle on vehicle if entity @s[tag=lockdown.context] run return 1
execute on vehicle on vehicle on passengers if entity @s[tag=lockdown.context] run return 1
execute on vehicle on vehicle on passengers on passengers if entity @s[tag=lockdown.context] run return 1

# No checks passed
return 0
