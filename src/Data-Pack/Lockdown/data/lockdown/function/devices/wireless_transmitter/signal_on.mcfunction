# This function handles starting the wireless signal broadcast
data modify entity @s[tag=lockdown.block.display] item.components."minecraft:item_model" set value "lockdown:machine/transmitter_on"
function lockdown:channels/start_broadcast
