# This function is used to set the profile of a mannequin to that of a random online player
# This is to be run BY the mannequin

# Set profile to a random player
data modify entity @s profile.id set from entity @r UUID

# Update state tags so this function doesn't get run on the same entity multiple times
tag @s add lockdown.bunker.clone.configured
