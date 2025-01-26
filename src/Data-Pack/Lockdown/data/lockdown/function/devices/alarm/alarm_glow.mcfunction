# This function runs the glow effect from powered alarms

# Update rotation
scoreboard players add @s lockdown.rotation 1
data modify storage lockdown:temp rotation set value {angle: 0.0f, axis: [0.0f, 0.0f, 1.0f]}
execute store result storage lockdown:temp rotation.angle float 0.5 run scoreboard players get @s lockdown.rotation
execute on passengers if entity @s[tag=lockdown.alarm.glow] run data modify entity @s transformation.left_rotation set from storage lockdown:temp rotation
execute on passengers if entity @s[tag=lockdown.alarm.glow] run data modify entity @s start_interpolation set value 0
