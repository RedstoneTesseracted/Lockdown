# This function approves the drone's current target and clears the target UUID.
# A subsequent line in lockdown:devices/drone/attacking/root will automatically detect
# that there's no longer a target, and will update state accordingly

# Add to list of approvals
data modify storage lockdown:temp approved set from entity @s data.approved
execute on vehicle on target run function lockdown:devices/drone/approval/add
data modify entity @s data.approved set from storage lockdown:temp approved

# Clear target UUID
execute on vehicle run data modify entity @s data.angry_at set value [I; 0, 0, 0, 0]
execute on vehicle run data modify entity @s AngryAt set value [I; 0, 0, 0, 0]

# Return to investigating state
function lockdown:devices/drone/state_change/attacking_to_investigating
