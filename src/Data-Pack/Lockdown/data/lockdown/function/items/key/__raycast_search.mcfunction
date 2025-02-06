# Recursive loop that tries to find the container that the player tried to use a key on

# Halt if this block is a container.  If it's a container, try to lock it
execute if data block ~ ~ ~ Items run return run function lockdown:items/key/attempt_lock

# Try again if we haven't found anything yet
scoreboard players remove lockdown.range lockdown.local 1
execute if score lockdown.range lockdown.local matches 0.. positioned ^ ^ ^0.5 run return run function lockdown:items/key/__raycast_search

return -1
