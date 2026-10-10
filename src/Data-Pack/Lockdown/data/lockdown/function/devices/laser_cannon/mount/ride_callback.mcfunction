# This function is run whenever a player tries to mount a cannon.
# It is called using an advancement trigger
# It is triggered using advancements.

# Reset advancement trigger
advancement revoke @s only lockdown:hidden/mount_cannon

# We don't want the player mounting the cannon if they're trying to paint it.
# Additionally, interaction entities interface with the spray can.
# To address both problems, we immediately return if the player is holding the spray
# can by running the spray can function.
execute if items entity @s weapon.* *[minecraft:custom_data~{lockdown_data: {name: "spray_paint"}}] run return run function lockdown:items/spray_paint/use

# Figure out which cannon platform the player interacted with
tag @e[tag=lockdown.context] remove lockdown.context
tag @a remove lockdown.context.source
tag @s add lockdown.context.source
execute store result score lockdown.gametime lockdown.local run time query gametime
scoreboard players set lockdown.found_interaction lockdown.local 0
execute as @e[tag=lockdown.behavior.rideable,tag=lockdown.laser_cannon,tag=lockdown.block.hitbox] run function lockdown:devices/laser_cannon/mount/find_interacted
tag @s remove lockdown.context.source

# Abort if cannon is already being ridden
execute as @n[tag=lockdown.context] if function lockdown:devices/laser_cannon/has_passenger run return run tag @s remove lockdown.context

# Mount player onto cannon
tag @s add lockdown.context.source
execute as @n[tag=lockdown.context] on passengers if entity @s[tag=lockdown.laser_cannon.seat] run ride @p[tag=lockdown.context.source] mount @s
tag @s remove lockdown.context.source

execute as @n[tag=lockdown.context] run function lockdown:devices/laser_cannon/mount/cannon_mount_state

# Clear state tags
tag @e[tag=lockdown.context] remove lockdown.context

execute if predicate lockdown:is_riding_cannon run function lockdown:devices/laser_cannon/mount/activate_player_mount
