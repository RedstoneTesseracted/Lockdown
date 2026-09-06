# Recursive raycast called by lockdown:devices/laser_cannon/fire/distance_raycast
# Halts if solid block is detected.
# Does NOT stop for entities

# Damage nearby entities
execute store result score lockdown.macro_result lockdown.local run function lockdown:devices/laser_cannon/fire/__damage_raycast_recursive with storage lockdown:temp beam_args
execute unless score lockdown.macro_result lockdown.local matches 1 run tellraw @p {translate: "lockdown.messages.bug.macro.generic", color: "red", with: [{text: "lockdown:devices/laser_cannon/fire/__damage_raycast_recursive", color:"gray", underlined: true}]}

# Bonus effect for firing at max charge
execute if score lockdown.cannon.charge lockdown.local >= lockdown.cannon_max_charge lockdown.constant run particle minecraft:sonic_boom ~ ~ ~ 0.0 0.0 0.0 1.0 1 force

# Continue raycast
scoreboard players add lockdown.distance lockdown.local 1
execute unless block ~ ~ ~ #lockdown:laser_transparent run function lockdown:devices/laser_cannon/fire/damage_raycast_wall_impact
execute if block ~ ~ ~ #lockdown:laser_transparent if score lockdown.distance lockdown.local < lockdown.cannon_max_range lockdown.constant positioned ^ ^ ^1 run function lockdown:devices/laser_cannon/fire/damage_raycast_recursive
