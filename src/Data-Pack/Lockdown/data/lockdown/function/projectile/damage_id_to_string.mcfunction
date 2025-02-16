# Converts damage ID stored in a score to a string stored in storage

execute if score lockdown.damage_type lockdown.local matches 0 run data modify storage lockdown:temp args.type set value "lockdown:generic_laser"
execute if score lockdown.damage_type lockdown.local matches 1 run data modify storage lockdown:temp args.type set value "lockdown:firey_generic_laser"
execute if score lockdown.damage_type lockdown.local matches 2 run data modify storage lockdown:temp args.type set value "lockdown:drone_laser"
execute if score lockdown.damage_type lockdown.local matches 3 run data modify storage lockdown:temp args.type set value "lockdown:firey_drone_laser"
execute if score lockdown.damage_type lockdown.local matches 4 run data modify storage lockdown:temp args.type set value "lockdown:turret_laser"
execute if score lockdown.damage_type lockdown.local matches 5 run data modify storage lockdown:temp args.type set value "lockdown:firey_turret_laser"
