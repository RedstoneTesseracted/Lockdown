# This function is called whenever the player uses an upgrade

# Figure out what entity the player targeted with the upgrade
# If no such entity exists, abort immediately
execute unless function lockdown:items/upgrade/find_target run return 0

# Run corresponding upgrade function
# Note: due to poor planning, the return value of the below functions is inverted
tag @s add lockdown.player_context
scoreboard players set lockdown.success lockdown.local 0
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{lockdown_data:{name:"control_tower_upgrade"}}] as @e[tag=lockdown.context,limit=1] unless function lockdown:items/upgrade/apply/control_tower run scoreboard players set lockdown.success lockdown.local 1
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{lockdown_data:{name:"durability_upgrade"}}] as @e[tag=lockdown.context,limit=1] unless function lockdown:items/upgrade/apply/durability run scoreboard players set lockdown.success lockdown.local 1
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{lockdown_data:{name:"range_upgrade"}}] as @e[tag=lockdown.context,limit=1] unless function lockdown:items/upgrade/apply/range run scoreboard players set lockdown.success lockdown.local 1
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{lockdown_data:{name:"flamethrower_upgrade"}}] as @e[tag=lockdown.context,limit=1] unless function lockdown:items/upgrade/apply/flamethrower run scoreboard players set lockdown.success lockdown.local 1

tag @s remove lockdown.player_context
tag @e[tag=lockdown.context] remove lockdown.context

# Consume item if upgrade applied
execute if score lockdown.success lockdown.local matches 1 run item modify entity @s weapon.mainhand lockdown:consume_item
execute if score lockdown.success lockdown.local matches 1 run playsound minecraft:block.anvil.use player @a ~ ~ ~ 1.0 2.0
