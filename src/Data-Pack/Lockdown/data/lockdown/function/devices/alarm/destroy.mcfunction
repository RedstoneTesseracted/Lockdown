# Handles the removal of an alarm block
# This is run BY and AT the base alarm entity

# Spawn the item
scoreboard players operation lockdown.channel lockdown.local = @s lockdown.channel
function lockdown:drop/alarm

# Common block removal functionality
function lockdown:devices/common_destroy
