# This function assigns the lockdown.turret.target tag to the entity
# with the matching target UUID.
# It is run BY the turret base entity

# Clear anything else with this tag
tag @e[tag=lockdown.turret.target] remove lockdown.turret.target

# Set up and run function macro that selects the target
execute store result storage lockdown:temp args.uuid1 int 1 run scoreboard players get @s lockdown.target_uuid1
execute store result storage lockdown:temp args.uuid2 int 1 run scoreboard players get @s lockdown.target_uuid2
execute store result storage lockdown:temp args.uuid3 int 1 run scoreboard players get @s lockdown.target_uuid3
execute store result storage lockdown:temp args.uuid4 int 1 run scoreboard players get @s lockdown.target_uuid4
return run function lockdown:devices/turret/__set_target_context with storage lockdown:temp args
