# This function removes an entity from the approval list
# Note: this adds the UUID to a temporary copy of the
# approval list.

data modify storage lockdown:temp args set value {uuid: [I;0,0,0,0]}
data modify storage lockdown:temp args.uuid set from entity @s UUID
function lockdown:devices/drone/approval/__remove with storage lockdown:temp args

# Always return 0 so evaluate_suspect can also return correctly
return 0
