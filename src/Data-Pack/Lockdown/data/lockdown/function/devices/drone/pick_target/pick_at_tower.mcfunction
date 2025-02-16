# This function handles shifting execution position to a control tower using function macros

$execute at @e[tag=lockdown.control_tower,limit=1,sort=nearest,scores={lockdown.channel=$(channel)},distance=..50] run function lockdown:devices/drone/pick_target/__pick_at_tower
return 1
