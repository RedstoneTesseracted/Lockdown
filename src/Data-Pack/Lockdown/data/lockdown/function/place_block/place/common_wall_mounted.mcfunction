# Common function used by wall-mounted custom blocks. It is run
# BY the new block root entity, and requires the direction score
# to be set.

tag @s add lockdown.behavior.wall_mounted
function lockdown:place_block/place/common_directional
