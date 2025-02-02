# This function ends a machine's broadcast to a wireless channel.
# Only applies if the machine HAS a channel, so a channel ID of 0 will do nothing.
# This is run BY and AT a sender entity

execute if score @s lockdown.channel matches 0 run return fail
tag @s remove lockdown.channel.sending
function lockdown:channels/update_nearby
