# Apply damage
scoreboard players set lockdown.damage_result lockdown.local 0
$execute positioned ~$(minus_half_damage_radius) ~$(minus_half_damage_radius) ~$(minus_half_damage_radius) store result score lockdown.damage_result lockdown.local as @e[type=!#lockdown:laser_ignore,dx=$(damage_radius),dy=$(damage_radius),dz=$(damage_radius),tag=lockdown.cannon.already_hit] run damage @s $(damage) lockdown:cannon_laser by @p[tag=lockdown.context]
$execute positioned ~$(minus_half_damage_radius) ~$(minus_half_damage_radius) ~$(minus_half_damage_radius) run tag @e[type=!#lockdown:laser_ignore,dx=$(damage_radius),dy=$(damage_radius),dz=$(damage_radius),tag=!lockdown.cannon.already_hit] add lockdown.cannon.already_hit

#$execute positioned ~$(minus_half_damage_radius) ~$(minus_half_damage_radius) ~$(minus_half_damage_radius) run particle minecraft:dust{color: [0.0, 0.0, 0.0], scale: 0.5} ~ ~ ~ 0.0 0.0 0.0 0.0 1
#$execute positioned ~$(minus_half_damage_radius) ~$(minus_half_damage_radius) ~$(minus_half_damage_radius) run particle minecraft:dust{color: [1.0, 0.0, 0.0], scale: 0.5} ~$(damage_radius) ~ ~ 0.0 0.0 0.0 0.0 1
#$execute positioned ~$(minus_half_damage_radius) ~$(minus_half_damage_radius) ~$(minus_half_damage_radius) run particle minecraft:dust{color: [0.0, 1.0, 0.0], scale: 0.5} ~ ~$(damage_radius) ~ 0.0 0.0 0.0 0.0 1
#$execute positioned ~$(minus_half_damage_radius) ~$(minus_half_damage_radius) ~$(minus_half_damage_radius) run particle minecraft:dust{color: [0.0, 0.0, 1.0], scale: 0.5} ~ ~ ~$(damage_radius) 0.0 0.0 0.0 0.0 1
#$execute positioned ~$(minus_half_damage_radius) ~$(minus_half_damage_radius) ~$(minus_half_damage_radius) run particle minecraft:dust{color: [1.0, 0.0, 1.0], scale: 0.5} ~$(damage_radius) ~ ~$(damage_radius) 0.0 0.0 0.0 0.0 1
#$execute positioned ~$(minus_half_damage_radius) ~$(minus_half_damage_radius) ~$(minus_half_damage_radius) run particle minecraft:dust{color: [0.0, 1.0, 1.0], scale: 0.5} ~ ~$(damage_radius) ~$(damage_radius) 0.0 0.0 0.0 0.0 1
#$execute positioned ~$(minus_half_damage_radius) ~$(minus_half_damage_radius) ~$(minus_half_damage_radius) run particle minecraft:dust{color: [1.0, 1.0, 0.0], scale: 0.5} ~$(damage_radius) ~$(damage_radius) ~ 0.0 0.0 0.0 0.0 1
#$execute positioned ~$(minus_half_damage_radius) ~$(minus_half_damage_radius) ~$(minus_half_damage_radius) run particle minecraft:dust{color: [1.0, 1.0, 1.0], scale: 0.5} ~$(damage_radius) ~$(damage_radius) ~$(damage_radius) 0.0 0.0 0.0 0.0 1

# Effects
execute if score lockdown.damage_result lockdown.local matches 1.. run playsound minecraft:entity.generic.explode neutral @a ~ ~ ~ 1.0 1.0
execute if score lockdown.damage_result lockdown.local matches 1.. run particle minecraft:explosion ~ ~ ~ 1.0 1.0 1.0 1.0 10

return 1
