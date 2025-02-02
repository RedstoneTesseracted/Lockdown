# This function begins broadcasting a wireless redstone signal to a channel.
# Only applies if the machine HAS a channel, so a channel ID of 0 will do nothing.
# This is run BY and AT a sender entity

execute if score @s lockdown.channel matches 0 run return fail
tag @s add lockdown.channel.sending
function lockdown:channels/update_nearby
