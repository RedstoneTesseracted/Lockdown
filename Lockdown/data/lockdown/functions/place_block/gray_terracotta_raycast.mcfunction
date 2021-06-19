# Attempt to find where the player placed the custom block by incrementing forwards
scoreboard players add @s ld_raycast_tries 1
execute if block ~ ~ ~ minecraft:gray_glazed_terracotta align xyz positioned ~0.5 ~ ~0.5 run function lockdown:place_block/setup_block
execute if score @s ld_raycast_tries matches ..100 unless block ~ ~ ~ minecraft:gray_glazed_terracotta positioned ^ ^ ^0.05 run function lockdown:place_block/gray_terracotta_raycast
