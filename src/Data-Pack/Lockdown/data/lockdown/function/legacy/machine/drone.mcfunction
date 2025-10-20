# This function upgrades a pre-R3 drone into an R3 one

# Grab scores from armor stand
scoreboard players operation lockdown.channel lockdown.local = @s ld_channel

# Spawn the intended item + upgrades
function lockdown:drop/drone
execute if entity @s[tag=ld_tower_controlled] run loot spawn ~ ~ ~ loot lockdown:legacy/control_tower_upgrade_return
execute if entity @s[tag=ld_durable] run loot spawn ~ ~ ~ loot lockdown:item/durability_upgrade
execute if entity @s[tag=ld_flamethrower] run loot spawn ~ ~ ~ loot lockdown:item/flamethrower_upgrade

# Remove legacy entities
execute on vehicle run kill @s[tag=ld_drone_hitbox]
kill @s[type=minecraft:armor_stand]
