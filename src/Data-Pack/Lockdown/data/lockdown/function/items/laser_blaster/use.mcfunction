# This function is called whenever the player uses a laser blaster

# Exit early if overheating
execute if score @s lockdown.laser_blaster.heat > lockdown.laser_blaster.max_heat lockdown.constant run playsound lockdown:laser.click player @a ~ ~ ~ 1.0 1.0
execute if score @s lockdown.laser_blaster.heat > lockdown.laser_blaster.max_heat lockdown.constant run return 0

# Consume a laser cell unless the player is in creative
execute if entity @s[gamemode=creative] run scoreboard players set lockdown.has_fuel lockdown.local 1
execute unless entity @s[gamemode=creative] store result score lockdown.has_fuel lockdown.local run clear @s *[minecraft:custom_data~{lockdown_data:{name: "redstone_energy_cell"}}] 1

execute if score lockdown.has_fuel lockdown.local matches 0 run playsound lockdown:laser.click player @a ~ ~ ~ 1.0 1.0
execute if score lockdown.has_fuel lockdown.local matches 0 run return 0

# Handle heat:
# * Firing the laser blaster increases the player's heat score by 20
# * The player's heat score decreases by 1 each tick until it reaches zero
# * There's a penalty for exceeding the heat limit of +20
# * The laser blaster cannot fire when the player's heat score is over the maximum

scoreboard players operation lockdown.laser_blaster.next_heat lockdown.local = @s lockdown.laser_blaster.heat
scoreboard players add lockdown.laser_blaster.next_heat lockdown.local 20
execute if score lockdown.laser_blaster.next_heat lockdown.local > lockdown.laser_blaster.max_heat lockdown.constant unless score @s lockdown.laser_blaster.heat > lockdown.laser_blaster.max_heat lockdown.constant run scoreboard players add lockdown.laser_blaster.next_heat lockdown.local 20
execute if score lockdown.laser_blaster.next_heat lockdown.local > lockdown.laser_blaster.max_heat lockdown.constant unless score @s lockdown.laser_blaster.heat > lockdown.laser_blaster.max_heat lockdown.constant run playsound lockdown:laser.overheat player @a ~ ~ ~ 2.0 1.0
scoreboard players operation @s lockdown.laser_blaster.heat = lockdown.laser_blaster.next_heat lockdown.local

# Get player look vector so we can set the laser velocity
execute positioned 0.0 0.0 0.0 rotated as @s positioned ^ ^ ^2 summon minecraft:marker run function lockdown:items/laser_blaster/get_look_vector

# Play effects
playsound lockdown:laser.quick player @a ~ ~ ~ 1.0 1.0

# Summon laser projectile and activate projectile loop (if it isn't already running)
execute store result score lockdown.uuid1 lockdown.local run data get entity @s UUID[0]
execute store result score lockdown.uuid2 lockdown.local run data get entity @s UUID[1]
execute store result score lockdown.uuid3 lockdown.local run data get entity @s UUID[2]
execute store result score lockdown.uuid4 lockdown.local run data get entity @s UUID[3]

# Damage the held item
item modify entity @s weapon.mainhand lockdown:damage_item_250
execute if items entity @s[gamemode=!creative,gamemode=!spectator] weapon.mainhand *[minecraft:damage=250] run function lockdown:items/laser_blaster/break

tag @s add lockdown.player.context
execute anchored eyes positioned ^ ^-0.5 ^0.5 summon minecraft:armor_stand run function lockdown:items/laser_blaster/configure_laser
tag @s remove lockdown.player.context
schedule function lockdown:projectile/tick 1t replace
