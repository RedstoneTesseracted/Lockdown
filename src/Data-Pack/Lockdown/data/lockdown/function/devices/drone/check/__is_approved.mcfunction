# Function macro used by is_approved to perform a list lookup

# Retrieve entry from list
data remove storage lockdown:temp retrieved
$execute store result score lockdown.result lockdown.local run data modify storage lockdown:temp retrieved set from storage lockdown:temp approved[{uuid:$(UUID)}]

# Return "-1" if not in list
execute if score lockdown.result lockdown.local matches 0 run return -1

# Check timestamp
execute store result score lockdown.timestamp lockdown.local run time query gametime
execute store result score lockdown.approved_timestamp lockdown.local run data get storage lockdown:temp retrieved.timestamp
scoreboard players operation lockdown.timestamp lockdown.local -= lockdown.approved_timestamp lockdown.local

$execute if score lockdown.approved_timestamp lockdown.local > lockdown.drone_approval_expire lockdown.constant run data remove storage lockdown:temp approved[{uuid:$(UUID)}]
execute if score lockdown.approved_timestamp lockdown.local > lockdown.drone_approval_expire lockdown.constant run return -1

# All checks passed
return 1
