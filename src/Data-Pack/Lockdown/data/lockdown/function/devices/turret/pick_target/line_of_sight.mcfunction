# This function eliminates target candidates that aren't within the turret's line-of-sight

tag @s add lockdown.turret.context
execute as @e[tag=lockdown.turret.candidate] unless function lockdown:devices/turret/pick_target/raycast_from_turret run tag @s remove lockdown.turret.candidate
tag @s remove lockdown.turret.context
