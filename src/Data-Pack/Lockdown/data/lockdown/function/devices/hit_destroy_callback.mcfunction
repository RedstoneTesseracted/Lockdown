# Event handler for when a "punch-to-destroy" entity is punched.
# This is called using an advancement trigger, and is therefore
# run BY and AT a player entity

# Reset advancement trigger
advancement revoke @s only lockdown:hidden/interact/hit_break

# Use the timestamp to determine which entity(s) need to be processed
execute store result score lockdown.time lockdown.local run time query gametime
execute as @e[tag=lockdown.behavior.attack_to_destroy,tag=lockdown.block.hitbox] store result score @s lockdown.time run data get entity @s attack.timestamp

# Abort if player is riding the entity
tag @e[tag=lockdown.context] remove lockdown.context
execute as @e[tag=lockdown.behavior.attack_to_destroy,tag=lockdown.block.hitbox] if score @s lockdown.time = lockdown.time lockdown.local run tag @s add lockdown.context
execute if function lockdown:devices/is_riding_hit_destroy run return run tag @e[tag=lockdown.context] remove lockdown.context
tag @e[tag=lockdown.context] remove lockdown.context

# Destroy relevant entities
execute as @e[tag=lockdown.behavior.attack_to_destroy,tag=lockdown.block.hitbox] if score @s lockdown.time = lockdown.time lockdown.local at @s run function lockdown:devices/hit_destroy
