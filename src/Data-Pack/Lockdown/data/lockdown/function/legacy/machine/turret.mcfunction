# This function upgrades a pre-R3 turret into an R3 one

# Grab scores from armor stand
scoreboard players operation lockdown.channel lockdown.local = @s ld_channel

# Spawn the intended item + upgrades
function lockdown:drop/turret
execute if entity @s[tag=ld_durable] run loot spawn ~ ~ ~ loot lockdown:item/durability_upgrade
execute if entity @s[tag=ld_flamethrower] run loot spawn ~ ~ ~ loot lockdown:item/flamethrower_upgrade

# Clean up legacy entities
kill @e[type=armor_stand,limit=1,sort=nearest,distance=..0.5,tag=ld_turret_blaster]
kill @s[type=armor_stand]
execute as @e[type=bee,tag=ld_turret_hitbox,distance=..0.5] at @s unless entity @e[type=minecraft:armor_stand,tag=ld_turret,distance=..0.5] run kill @s
