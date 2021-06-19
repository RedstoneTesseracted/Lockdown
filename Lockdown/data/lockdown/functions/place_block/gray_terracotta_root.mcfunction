# Begin doing custom block stuff
scoreboard players set @s ld_success 0
scoreboard players set @s ld_raycast_tries 0

# Try several different offsets before admitting defeat
execute at @s if entity @s[scores={ld_id=1..}] anchored eyes positioned ^ ^-0.1 ^ run function lockdown:place_block/gray_terracotta_raycast
scoreboard players set @s ld_raycast_tries 0

execute at @s if entity @s[scores={ld_id=1..,ld_success=0}] anchored eyes positioned ^ ^0.1 ^ run function lockdown:place_block/gray_terracotta_raycast
scoreboard players set @s ld_raycast_tries 0

execute at @s if entity @s[scores={ld_id=1..,ld_success=0}] anchored eyes positioned ^0.1 ^ ^ run function lockdown:place_block/gray_terracotta_raycast
scoreboard players set @s ld_raycast_tries 0

execute at @s if entity @s[scores={ld_id=1..,ld_success=0}] anchored eyes positioned ^-0.1 ^ ^ run function lockdown:place_block/gray_terracotta_raycast
scoreboard players set @s ld_raycast_tries 0

# Reset placement score
scoreboard players set @s ld_place_block 0
