# This function executes lockdown device placer entities found in structures,
# causing them to place their respective block before removing themselves
#
# Due to structures not preserving passengers, we have to populate them with
# placers and delay them from executing until after world generation.
#
# A configuration boolean "lockdown.block_structure_placers" is used to block
# these special structure places in the original creative world where they were built.
# 

execute if score lockdown.block_structure_placers lockdown.constant matches 1 run return 1
execute as @e[tag=lockdown.placer,tag=lockdown.structure_placer] at @s run function lockdown:place_block/placer
execute as @e[tag=lockdown.bunker.clone,tag=!lockdown.bunker.clone.configured] at @s run function lockdown:player_clone
return 1
