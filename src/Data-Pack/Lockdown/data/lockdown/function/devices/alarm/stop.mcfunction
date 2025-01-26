# This function ends the alarm glow effect

# Update model
execute on passengers if entity @s[tag=lockdown.block.display] run data remove entity @s brightness
execute on passengers if entity @s[tag=lockdown.alarm.glow] run data modify entity @s transformation.scale set value [0.0f, 0.0f, 0.0f]
execute on passengers if entity @s[tag=lockdown.alarm.glow] run data modify entity @s start_interpolation set value 0
execute on passengers if entity @s[tag=lockdown.alarm.glow] run item modify entity @s container.0 lockdown:state/first_flag_false

# Update state tags
tag @s remove lockdown.powered
