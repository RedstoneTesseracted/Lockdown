# This function is called by lockdown:items/spray_paint/apply to shift execution to the one or more display entities making up lockdown entities

# By default, the list of model tints is empty.
# So, we populate its default values defined in the item model before trying to modify it
execute store result score lockdown.result lockdown.local run data get entity @s item.components."minecraft:custom_model_data".colors
execute if score lockdown.result lockdown.local matches 0 run data modify entity @s item.components."minecraft:custom_model_data".colors set value [[1.0, 1.0, 1.0], [0.200, 0.604, 0.988]]
execute if score lockdown.result lockdown.local matches 1 run data modify entity @s item.components."minecraft:custom_model_data".colors append value [0.200, 0.604, 0.988]

# Apply color according to what lockdown:items/spray_paint/get_action wrote to "paint" in the lockdown:temp storage
execute if data storage lockdown:temp paint{mode: "primary"} run data modify entity @s item.components."minecraft:custom_model_data".colors[0] set from storage lockdown:temp paint.color
execute if data storage lockdown:temp paint{mode: "secondary"} run data modify entity @s item.components."minecraft:custom_model_data".colors[1] set from storage lockdown:temp paint.color

# This is used by lockdown:items/spray_paint/apply to show additional particle effects when painting succeeded
scoreboard players set lockdown.success lockdown.local 1
