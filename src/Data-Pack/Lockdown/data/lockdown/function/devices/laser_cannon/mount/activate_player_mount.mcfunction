# This function activates several effects when a player mounts a laser cannon:
# * Camera distance zoom-out
# * Show cannon charge bar

# Zoom out
attribute @s minecraft:camera_distance modifier add lockdown.laser_cannon.is_riding 4.0 add_value

# Show progress bar
data modify storage lockdown:temp args set value {id: 0, max: 0}
execute store result storage lockdown:temp args.id int 1 run scoreboard players get @s lockdown.player_id
execute store result storage lockdown:temp args.max int 1 run scoreboard players get lockdown.cannon_max_charge lockdown.constant
execute store result score lockdown.result lockdown.local run function lockdown:devices/laser_cannon/mount/__activate_player_mount with storage lockdown:temp args
execute unless score lockdown.result lockdown.local matches 1 run tellraw @s {translate: "lockdown.messages.bug.macro.generic", color: "red", with: [{text: "lockdown:devices/laser_cannon/mount/__activate_player_mount", color:"gray", underlined: true}]}

# Show help text
title @s actionbar {translate: "lockdown.messages.laser_cannon.control_hint", with: [{keybind: "key.jump", color: "gold"}, {keybind: "key.forward", color: "gold"}]}

# Add state tag for tracking which players might need this state cleared later
tag @s add lockdown.laser_cannon.is_riding

# Activate the per-tick function meant to clear zoom-out once player unmounts
schedule function lockdown:devices/laser_cannon/riding_tick 1t append
