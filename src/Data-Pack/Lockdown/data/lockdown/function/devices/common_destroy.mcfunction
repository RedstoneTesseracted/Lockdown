# This runs commands common amongst all block-destruction functions
# Namely: removing the entity and clearing the dropped item's tag

# Handle the case where a piston was used to destroy this block
execute if block ~ ~ ~ minecraft:moving_piston run function lockdown:devices/handle_piston

# Unmark dropped item for configuration
tag @e[tag=lockdown.item.configure] remove lockdown.item.configure

# Drop upgrades
function lockdown:devices/common_upgrade_drop

# Destroy all entities associated with this block
tag @s add lockdown.not_yet
execute on vehicle on passengers run kill @s[tag=!lockdown.not_yet]
execute on vehicle run kill @s[tag=lockdown.block]
execute on passengers run kill @s[tag=lockdown.block]
kill @s[tag=lockdown.block]
