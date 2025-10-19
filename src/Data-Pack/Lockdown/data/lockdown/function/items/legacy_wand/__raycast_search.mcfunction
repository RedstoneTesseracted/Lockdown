# Recursive loop that tries to find the legacy block that the player tried to use the wand on

# Attempt to upgrade legacy device at current position (if applicable)
execute as @e[dx=0,dy=0,dz=0,tag=ld_block] if function lockdown:legacy/drop_legacy_device run return 1

# Try again if we haven't found anything yet
scoreboard players remove lockdown.range lockdown.local 1
execute if score lockdown.range lockdown.local matches 0.. positioned ^ ^ ^0.5 run return run function lockdown:items/legacy_wand/__raycast_search

return -1
