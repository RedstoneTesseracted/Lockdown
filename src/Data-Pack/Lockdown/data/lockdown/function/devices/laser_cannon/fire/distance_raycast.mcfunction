# This function performs a raycast to find the distance that the beam can travel

scoreboard players set lockdown.distance lockdown.local 0

data modify storage lockdown:temp args set value {azimuth: 0.0, pitch: 0.0}
execute store result storage lockdown:temp args.azimuth float 0.01 run scoreboard players get @s lockdown.azimuth
execute store result storage lockdown:temp args.pitch float 0.01 run scoreboard players get @s lockdown.pitch
execute store result score lockdown.macro_result lockdown.local run function lockdown:devices/laser_cannon/fire/__distance_raycast with storage lockdown:temp args
execute unless score lockdown.macro_result lockdown.local matches 1 run tellraw @p {translate: "lockdown.messages.bug.macro.generic", color: "red", with: [{text: "lockdown:devices/laser_cannon/fire/__distance_raycast", color:"gray", underlined: true}]}
