# This function is called by lockdown:devices/laser_cannon/fire/update whenever the cannon is charging.
# This is run BY and AT the root cannon entity

# Begin charging (if applicable)
execute if score @s lockdown.cannon.charge matches 0 run function lockdown:devices/laser_cannon/fire/begin_charging

# Increment charge counter
execute if score @s lockdown.cannon.charge < lockdown.cannon_max_charge lockdown.constant run scoreboard players add @s lockdown.cannon.charge 1

# Visuals
data modify storage lockdown:temp args set value {azimuth: 0.0, pitch: 0.0}
execute store result storage lockdown:temp args.azimuth float 0.01 run scoreboard players get @s lockdown.azimuth
execute store result storage lockdown:temp args.pitch float 0.01 run scoreboard players get @s lockdown.pitch
execute store result score lockdown.macro_result lockdown.local run function lockdown:devices/laser_cannon/fire/__cannon_particles with storage lockdown:temp args
execute unless score lockdown.macro_result lockdown.local matches 1 run tellraw @p {translate: "lockdown.messages.bug.macro.generic", color: "red", with: [{text: "lockdown:devices/laser_cannon/fire/__cannon_particles", color:"gray", underlined: true}]}
