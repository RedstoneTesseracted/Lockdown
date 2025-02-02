# This function checks if there's a player with the correct keycard nearby

scoreboard players operation lockdown.channel lockdown.local = @s lockdown.channel
execute as @a[distance=..5,predicate=lockdown:keycard_any] if score @s lockdown.held_channel = lockdown.channel lockdown.local run return 1
return 0
