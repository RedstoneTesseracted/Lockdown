# This function is run immediately by the temporary beam effect entity

# Assign tags/scores
tag @s add lockdown.turret.laser_beam
tag @s add lockdown.effect
execute store result score @s lockdown.time run time query gametime

# Orient entity
# Arguments were obtained by impact_normal/impact_flamethrower
function lockdown:devices/turret/fire/__configure_beam with storage lockdown:temp args

# Set transformation
# data modify entity @s transformation set from entity @n[tag=lockdown.block.display,tag=lockdown.turret.barrel] transformation
execute store result entity @s transformation.scale[2] float 1.0 run scoreboard players get lockdown.attempts lockdown.local

# Set item
item replace entity @s container.0 with minecraft:paper[minecraft:item_model="lockdown:laser_beam"]

# Schedule function to kill this entity
schedule function lockdown:devices/turret/fire/scheduled_beam_destroy 10t append
