# This function switches the drone from standby to one of the two "hostile" states:
#   If far from target: enable "approaching" state
#   If near target: enable "firing state"
#
# This is run BY and AT the drone root entity

# Store result of predicate to ensure the next two conditions run with the same check result
scoreboard players set lockdown.result lockdown.local 0
execute if predicate lockdown:vehicle_near_target run scoreboard players set lockdown.result lockdown.local 1

execute if score lockdown.result lockdown.local matches 0 run function lockdown:devices/drone/state/approaching
execute if score lockdown.result lockdown.local matches 1 run function lockdown:devices/drone/state/firing
