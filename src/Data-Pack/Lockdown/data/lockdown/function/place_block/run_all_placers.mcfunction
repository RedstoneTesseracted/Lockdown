# This function executes ALL lockdown device placer entities,
# causing them to place their respective block before removing themselves.
#
# Due to placed structures not preserving passengers, structures are given
# modified placers that only run when lockdown:place_block/run_structure_placers is called.

execute as @e[tag=lockdown.placer,tag=!lockdown.structure_placer] at @s run function lockdown:place_block/placer

return 1
