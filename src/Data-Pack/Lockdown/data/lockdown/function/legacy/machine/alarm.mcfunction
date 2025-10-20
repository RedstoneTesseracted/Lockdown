# This function upgrades a pre-R3 alarm into an R3 one

# Grab scores from armor stand
execute store result score lockdown.legacy_model_id lockdown.local run data get entity @s equipment.head.components."minecraft:custom_data".LockdownData.item_model
scoreboard players operation lockdown.channel lockdown.local = @s ld_channel

# Map item model ID to color tag
execute if score lockdown.legacy_model_id lockdown.local matches 10042 run tag @s add lockdown.color.white
execute if score lockdown.legacy_model_id lockdown.local matches 10043 run tag @s add lockdown.color.orange
execute if score lockdown.legacy_model_id lockdown.local matches 10044 run tag @s add lockdown.color.magenta
execute if score lockdown.legacy_model_id lockdown.local matches 10045 run tag @s add lockdown.color.light_blue
execute if score lockdown.legacy_model_id lockdown.local matches 10046 run tag @s add lockdown.color.yellow
execute if score lockdown.legacy_model_id lockdown.local matches 10047 run tag @s add lockdown.color.lime
execute if score lockdown.legacy_model_id lockdown.local matches 10048 run tag @s add lockdown.color.pink
execute if score lockdown.legacy_model_id lockdown.local matches 10049 run tag @s add lockdown.color.gray
execute if score lockdown.legacy_model_id lockdown.local matches 10050 run tag @s add lockdown.color.light_gray
execute if score lockdown.legacy_model_id lockdown.local matches 10051 run tag @s add lockdown.color.cyan
execute if score lockdown.legacy_model_id lockdown.local matches 10052 run tag @s add lockdown.color.purple
execute if score lockdown.legacy_model_id lockdown.local matches 10053 run tag @s add lockdown.color.blue
execute if score lockdown.legacy_model_id lockdown.local matches 10054 run tag @s add lockdown.color.brown
execute if score lockdown.legacy_model_id lockdown.local matches 10055 run tag @s add lockdown.color.green
execute if score lockdown.legacy_model_id lockdown.local matches 10056 run tag @s add lockdown.color.red
execute if score lockdown.legacy_model_id lockdown.local matches 10057 run tag @s add lockdown.color.black

# Spawn the intended item
function lockdown:drop/alarm

# Clean up legacy block/entity
setblock ~ ~ ~ minecraft:air
kill @s[type=minecraft:armor_stand]
