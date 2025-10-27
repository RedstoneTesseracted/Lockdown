# Root function for the force field

execute if block ~ ~ ~ minecraft:note_block[powered=true] if entity @s[tag=!lockdown.powered] run function lockdown:devices/force_field_projector/activate
execute if block ~ ~ ~ minecraft:note_block[powered=false] if entity @s[tag=lockdown.powered] run function lockdown:devices/force_field_projector/deactivate
execute unless block ~ ~ ~ #lockdown:redstone_input run function lockdown:devices/force_field_projector/destroy
