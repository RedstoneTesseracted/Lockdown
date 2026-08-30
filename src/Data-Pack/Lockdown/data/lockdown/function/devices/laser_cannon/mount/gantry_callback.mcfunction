# This function is called whenever the player attempts to mount a gantry onto a cannon platform.
# It is called using an advancement trigger

# Clear advancement trigger
advancement revoke @s only lockdown:hidden/gantry_use

# Figure out which cannon platform the player interacted with
tag @e[tag=lockdown.context] remove lockdown.context
tag @a remove lockdown.context.source
tag @s add lockdown.context.source
execute store result score lockdown.gametime lockdown.local run time query gametime
scoreboard players set lockdown.found_interaction lockdown.local 0
execute as @e[tag=lockdown.laser_cannon.base,tag=lockdown.block.hitbox] run function lockdown:devices/laser_cannon/mount/find_interacted
tag @s remove lockdown.context.source

# Abort if the platform already has a gantry mounted
execute if entity @e[tag=lockdown.context,tag=lockdown.laser_cannon.has_gantry] run return run function lockdown:devices/laser_cannon/mount/reject_gantry

# Mount the gantry onto the platform
execute as @e[tag=lockdown.context,limit=1,tag=lockdown.laser_cannon.base] at @s run function lockdown:devices/laser_cannon/mount/add_gantry

# Remove item from player's hand unless they're in creative
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{lockdown_data:{name: "cannon_gantry"}}] run return run item modify entity @s weapon.mainhand lockdown:consume_item
execute if items entity @s weapon.offhand *[minecraft:custom_data~{lockdown_data:{name: "cannon_gantry"}}] run return run item modify entity @s weapon.offhand lockdown:consume_item
