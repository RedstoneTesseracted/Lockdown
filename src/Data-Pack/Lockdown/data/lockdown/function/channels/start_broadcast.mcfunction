# This function begins broadcasting a wireless redstone signal to a channel.
# A channel ID of 0 will do nothing.
# This is run BY and AT a root block entity

execute if score @s lockdown.channel matches 0 run return fail
tag @s add lockdown.channel.active
function lockdown:channels/update

