# This function updates the state of a channel receiver
# It is run BY and AT a channel receiver entity

# Reset source counter
scoreboard players set lockdown.channel.sources lockdown.local 0

# Count the number of senders within range that are on this channel
scoreboard players operation lockdown.channel lockdown.local = @s lockdown.channel
execute as @e[distance=..50,tag=lockdown.channel.sending] if score @s lockdown.channel = lockdown.channel lockdown.local run scoreboard players add lockdown.channel.sources lockdown.local 1

# Update state tags based on total count
execute if score lockdown.channel.sources lockdown.local matches 0 run tag @s remove lockdown.channel.receiving
execute if score lockdown.channel.sources lockdown.local matches 1.. run tag @s add lockdown.channel.receiving
