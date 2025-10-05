# This function checks whether an entity is within the drone's
# list of previously approved entities
#
# This will also automatically remove an entity from the approved list
# if their timestamp has expired.  However, since this change is done
# on a temporary copy, the drone must re-set its list from said copy
# after executing this function.
#
# The list must be stored in the lockdown:temp storage under "approved"
# This is run BY the entity to be checked

# Copy UUID to use as argument for function macro
data modify storage lockdown:temp args set value {}
data modify storage lockdown:temp args.UUID set from entity @s UUID

execute store result score lockdown.result lockdown.local run function lockdown:devices/drone/check/__is_approved with storage lockdown:temp args

execute if score lockdown.result lockdown.local matches -1 run return 0
execute if score lockdown.result lockdown.local matches 1 run return 1
# A return value of "0" indicates the function did not run
execute if score lockdown.result lockdown.local matches 0 run return 0
