# This function executes ALL lockdown device placer entities,
# causing them to place their respective block before removing themselves

execute as @e[tag=lockdown.placer] at @s run function lockdown:place_block/placer

return 1
