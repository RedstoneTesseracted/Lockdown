# This function runs when the laser projectile impacts a surface

# Do damage
execute store result storage lockdown:temp args.damage int 1 run scoreboard players get @s lockdown.firing_damage
data modify storage lockdown:temp args.type set from entity @s item.components."minecraft:custom_data".lockdown_data.damage_type
execute store success score lockdown.macro_status lockdown.local as @e[tag=lockdown.collide] run function lockdown:projectile/damage_macro with storage lockdown:temp args
tag @e[tag=lockdown.collide] remove lockdown.collide
execute if score lockdown.macro_status lockdown.local matches 0 run title @p actionbar {translate: "lockdown.messages.bug.macro.generic",color: "red", with: [{text: "lockdown:projectile/damage_macro", color: "gray", underlined: true}]}

# Play effects
particle minecraft:dust_plume ~ ~ ~ 0.5 0.5 0.5 0.0 20
particle minecraft:dust{color:[1.0f,0.0f,0.0f],scale:0.5f} ~ ~ ~ 0.25 0.25 0.25 0.0 20

# Destroy entity
function lockdown:projectile/common/destroy
