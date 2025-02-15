# This function assigns the lockdown.turret.target tag to the entity
# with the matching target UUID.
# It is run BY the turret base entity

# Clear anything else with this tag
tag @e[tag=lockdown.turret.target] remove lockdown.turret.target

# Tag the current target of the hidden bee entity
execute on passengers if entity @s[type=minecraft:bee] on target run return run tag @s add lockdown.turret.target
