# This runs commands common amongst all block-destruction functions
# Namely: removing the entity and clearing the dropped item's tag

# Unmark dropped item for configuration
tag @e[tag=lockdown.item.configure] remove lockdown.item.configure

# Destroy all entities associated with this block
execute on passengers run kill @s[tag=lockdown.block]
kill @s[tag=lockdown.block]
