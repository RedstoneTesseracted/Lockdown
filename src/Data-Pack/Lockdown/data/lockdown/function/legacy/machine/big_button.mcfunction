# This function upgrades a pre-R3 big button into an R3 one

# Grab scores from armor stand
execute store result score lockdown.legacy_model_id lockdown.local run data get entity @s equipment.head.components."minecraft:custom_data".LockdownData.item_model
scoreboard players operation lockdown.channel lockdown.local = @s ld_channel

# Map item model ID to color tag
execute if score lockdown.legacy_model_id lockdown.local matches 10026 run tag @s add lockdown.color.white
execute if score lockdown.legacy_model_id lockdown.local matches 10027 run tag @s add lockdown.color.orange
execute if score lockdown.legacy_model_id lockdown.local matches 10028 run tag @s add lockdown.color.magenta
execute if score lockdown.legacy_model_id lockdown.local matches 10029 run tag @s add lockdown.color.light_blue
execute if score lockdown.legacy_model_id lockdown.local matches 10030 run tag @s add lockdown.color.yellow
execute if score lockdown.legacy_model_id lockdown.local matches 10031 run tag @s add lockdown.color.lime
execute if score lockdown.legacy_model_id lockdown.local matches 10032 run tag @s add lockdown.color.pink
execute if score lockdown.legacy_model_id lockdown.local matches 10033 run tag @s add lockdown.color.gray
execute if score lockdown.legacy_model_id lockdown.local matches 10034 run tag @s add lockdown.color.light_gray
execute if score lockdown.legacy_model_id lockdown.local matches 10035 run tag @s add lockdown.color.cyan
execute if score lockdown.legacy_model_id lockdown.local matches 10036 run tag @s add lockdown.color.purple
execute if score lockdown.legacy_model_id lockdown.local matches 10037 run tag @s add lockdown.color.blue
execute if score lockdown.legacy_model_id lockdown.local matches 10038 run tag @s add lockdown.color.brown
execute if score lockdown.legacy_model_id lockdown.local matches 10039 run tag @s add lockdown.color.green
execute if score lockdown.legacy_model_id lockdown.local matches 10040 run tag @s add lockdown.color.red
execute if score lockdown.legacy_model_id lockdown.local matches 10041 run tag @s add lockdown.color.black

# Spawn the intended item
function lockdown:drop/button

# Clean up legacy block/entity
setblock ~ ~ ~ minecraft:air
kill @s[type=minecraft:armor_stand]
