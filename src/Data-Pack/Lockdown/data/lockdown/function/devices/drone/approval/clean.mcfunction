# This function iterates through a drone's entire approval list and 
# removes entries that have since expired.

# Iterate over a copy of the approved list
data modify storage lockdown:temp approved_process set from storage lockdown:temp approved
data modify storage lockdown:temp approved_keep set value []

# Enter recursive loop
execute store result score lockdown.timestamp lockdown.local run time query gametime
execute if data storage lockdown:temp approved_copy[0] run function lockdown:devices/drone/approval/__clean

# Push changes to the expected location
data modify storage lockdown:temp approved set from storage lockdown:temp approved_keep
data remove storage lockdown:temp approved_keep
data remove storage lockdown:temp approved_copy
