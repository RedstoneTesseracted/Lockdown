# This function handles ending the wireless signal broadcast
data modify entity @s[tag=lockdown.block.display] item.components."minecraft:item_model" set value "lockdown:machine/transmitter_off"
function lockdown:channels/end_broadcast
