# This function starts the alarm glow effect

# Update model
execute on passengers if entity @s[tag=lockdown.block.display] run data modify entity @s brightness set value {sky: 15, block: 15}
execute on passengers if entity @s[tag=lockdown.alarm.glow] run data modify entity @s transformation.scale set value [1.0f, 1.0f, 1.0f]
execute on passengers if entity @s[tag=lockdown.alarm.glow] run data modify entity @s start_interpolation set value 0
execute on passengers if entity @s[tag=lockdown.alarm.glow] run item modify entity @s container.0 lockdown:state/first_flag_true

# Update state tags
tag @s add lockdown.powered
