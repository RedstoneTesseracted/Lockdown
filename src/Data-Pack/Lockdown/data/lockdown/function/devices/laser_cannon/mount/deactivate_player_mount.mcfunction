# This function resets the camera distance increase and charge bar introduced by lockdown:devices/laser_cannon/mount/activate_player_mount

# Reset camera distance
attribute @s minecraft:camera_distance modifier remove lockdown.laser_cannon.is_riding

# Hide progress bar
data modify storage lockdown:temp args set value {id: 0}
execute store result storage lockdown:temp args.id int 1 run scoreboard players get @s lockdown.player_id
execute store result score lockdown.result lockdown.local run function lockdown:devices/laser_cannon/mount/__deactivate_player_mount with storage lockdown:temp args
execute unless score lockdown.result lockdown.local matches 1 run tellraw @s {translate: "lockdown.messages.bug.macro.generic", color: "red", with: [{text: "lockdown:devices/laser_cannon/mount/__deactivate_player_mount", color:"gray", underlined: true}]}
# Clear state tags
tag @s remove lockdown.laser_cannon.is_riding
