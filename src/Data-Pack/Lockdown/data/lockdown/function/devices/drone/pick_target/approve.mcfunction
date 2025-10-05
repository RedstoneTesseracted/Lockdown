# This function marks an entity as being "approved"
# Note: this adds the UUID to a temporary copy of the
# approval list.

data modify storage lockdown:temp new_approval set value {uuid: [I;0,0,0,0], timestamp: 0L}
execute store result storage lockdown:temp new_approval.timestamp long 1 run time query gametime
data modify storage lockdown:temp new_approval.uuid set from entity @s UUID
data modify storage lockdown:temp approved append from storage lockdown:temp new_approval
data remove storage lockdown:temp new_approval

# Always return 0 so evaluate_suspect can also return correctly
return 0
