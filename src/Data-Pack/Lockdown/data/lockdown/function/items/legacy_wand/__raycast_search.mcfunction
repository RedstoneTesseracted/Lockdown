# Recursive loop that tries to find the legacy block that the player tried to use the wand on

# Attempt to upgrade legacy device at current position (if applicable)
execute as @n[distance=..1,tag=ld_block] at @s run return run function lockdown:legacy/drop_legacy_device

# Try again if we haven't found anything yet
scoreboard players remove lockdown.range lockdown.local 1
execute if score lockdown.range lockdown.local matches 0.. positioned ^ ^ ^0.5 run return run function lockdown:items/legacy_wand/__raycast_search

return -1
