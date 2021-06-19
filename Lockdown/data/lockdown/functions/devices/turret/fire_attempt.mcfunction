# First check if the line of sight is clear
scoreboard players set @s ld_raycast_tries 0
scoreboard players set @s ld_result 0
function lockdown:devices/turret/check_target

# If the line of sight is clear, fire the turret
execute if score @s ld_result matches 1.. run function lockdown:devices/turret/fire_turret
