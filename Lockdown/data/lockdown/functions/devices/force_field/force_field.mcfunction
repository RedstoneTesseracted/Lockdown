execute if block ~ ~ ~ minecraft:note_block[powered=true] if entity @s[tag=!ld_projecting] run function lockdown:devices/force_field/field_on
execute if block ~ ~ ~ minecraft:note_block[powered=false] if entity @s[tag=ld_projecting] run function lockdown:devices/force_field/field_off
#execute if entity @a[distance=..5,scores={ld_use_noteblock=1..}] run function lockdown:devices/force_field/outline
execute unless block ~ ~ ~ #lockdown:redstone_input run function lockdown:devices/force_field/force_field_destroy
