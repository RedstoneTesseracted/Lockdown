# This function manually applies a durability upgrade to a drone
# This is run BY the drone hitbox entity

# Manually set context tag
tag @e[tag=lockdown.context] remove lockdown.context
tag @s add lockdown.context

# Apply the actual upgrade
function lockdown:items/upgrade/apply/durability

# Make sure context tag is cleared
tag @e[tag=lockdown.context] remove lockdown.context
