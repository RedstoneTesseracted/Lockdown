# This function uses a raycast to determine what container the player is looking at.
# This is called from ./use.mcfunction BY and AT the player
# The actual loop is implemented in ./__raycast_search using recursion

# Get player's block reach (times 2, because __raycast_search increments by 0.5 blocks)
execute store result score lockdown.range lockdown.local run attribute @s minecraft:block_interaction_range get 2.0

# Run raycast loop
execute anchored eyes positioned ^ ^ ^ run return run function lockdown:items/legacy_wand/__raycast_search


