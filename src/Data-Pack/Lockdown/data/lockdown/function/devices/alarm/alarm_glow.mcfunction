# This function runs the glow effect from powered alarms

# Update rotation
scoreboard players add @s lockdown.rotation 1
function lockdown:devices/alarm/prepare_rotation_tag
execute store result storage lockdown:temp rotation.angle float 0.5 run scoreboard players get @s lockdown.rotation
execute on passengers if entity @s[tag=lockdown.alarm.glow] run data modify entity @s transformation.left_rotation set from storage lockdown:temp rotation
execute on passengers if entity @s[tag=lockdown.alarm.glow] run data modify entity @s start_interpolation set value 0
