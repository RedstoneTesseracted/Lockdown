# This function contains various fixes for unlikely problems that would
# ordinarily soft-lock the player.
# The necessity of this is questionable, but we check anyways just to be safe.

# You shouldn't have those
function lockdown:clear_forbidden

# Reset advancement triggers
advancement revoke @a through lockdown:hidden/root

# Eliminate temporary beam entities that somehow got left over
function lockdown:devices/turret/fire/scheduled_beam_destroy

# Maintain invisible bees
effect give @e[type=minecraft:bee,tag=lockdown.block.hitbox] invisibility infinite 1 true
execute as @e[type=minecraft:bee,tag=lockdown.block.hitbox] run data modify entity @s CannotEnterHiveTicks set value 2147483647
execute as @e[type=minecraft:bee,tag=lockdown.block.hitbox] run data modify entity @s TicksSincePollination set value 2147483647

# Schedule this function to run again
schedule function lockdown:periodic_fix 0.5d replace
