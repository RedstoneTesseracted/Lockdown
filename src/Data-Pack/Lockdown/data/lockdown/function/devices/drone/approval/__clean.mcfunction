# Looped function called by lockdown:devices/drone/approval/clean to check
# each entry in the approval list

# Check timestamp and add to "keep" if it passes
execute store result score lockdown.timestamp lockdown.local run time query gametime
execute store result score lockdown.approved_timestamp lockdown.local run data get storage lockdown:temp approved_copy[0].timestamp
scoreboard players operation lockdown.timestamp lockdown.local -= lockdown.approved_timestamp lockdown.local
execute if score lockdown.timestamp lockdown.local <= lockdown.drone_approval_expire lockdown.constant run data modify storage lockdown:temp approved_keep append from storage lockdown:temp approved_copy[0]

# Run again if entries remain
data remove storage lockdown:temp approved_copy[0]
execute if data storage lockdown:temp approved_copy[0] run function lockdown:devices/drone/approval/__clean
