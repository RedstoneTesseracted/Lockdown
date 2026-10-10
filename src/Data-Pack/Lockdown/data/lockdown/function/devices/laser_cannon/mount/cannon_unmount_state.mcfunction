# This function updates the cannon state after a player unmounts it.  This includes:
# * Removing the state tag added by cannon_mount_state
# * Unsetting a boolean in the barrel's custom model data to enable translucency-on-key press
#
# This is run BY the root cannon entity

# Update barrel custom model data
execute on passengers if entity @s[tag=lockdown.laser_cannon.barrel] run data modify entity @s item.components."minecraft:custom_model_data".flags[0] set value false

# Update state tags
tag @s remove lockdown.laser_cannon.translucency
