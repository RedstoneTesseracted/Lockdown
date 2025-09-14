# Handles the removal of an alarm block
# This is run BY and AT the base alarm entity

# Destroy the incorrect item
kill @n[type=minecraft:item,distance=..1,nbt={Item:{id:"minecraft:acacia_button"}}]

# Spawn the item
scoreboard players operation lockdown.channel lockdown.local = @s lockdown.channel
function lockdown:drop/button

# Update channels
tag @s remove lockdown.sending
function lockdown:channels/end_broadcast

# Common block removal functionality
function lockdown:devices/common_destroy

