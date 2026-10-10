# This function updates the cannon state after a player mounts it.  This includes:
# * Added a tag to indicate translucency status
# * Setting a boolean in the barrel's custom model data to enable translucency-on-key press
#
# This is run BY the root cannon entity

# Update barrel custom model data
execute on passengers if entity @s[tag=lockdown.laser_cannon.barrel] unless data entity @s item.components."minecraft:custom_model_data".flags run data modify entity @s item.components."minecraft:custom_model_data".flags set value [false]
execute on passengers if entity @s[tag=lockdown.laser_cannon.barrel] run data modify entity @s item.components."minecraft:custom_model_data".flags[0] set value true

# Update state tags
tag @s add lockdown.laser_cannon.translucency
