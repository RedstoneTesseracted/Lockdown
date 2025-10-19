# This function checks if the drone's target is within pursuit range

data modify storage lockdown:temp args set value {r: 0}
execute store result storage lockdown:temp args.r int 1 run scoreboard players get @s lockdown.pursuit_enter_range
return run function lockdown:devices/drone/check/__target_within_range_macro with storage lockdown:temp args
