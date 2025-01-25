execute if block ~ ~ ~ minecraft:note_block[powered=true] if entity @s[tag=!ld_alarmed] run function lockdown:devices/klaxon/alarm_start
execute if block ~ ~ ~ minecraft:note_block[powered=false] if entity @s[tag=ld_alarmed] run function lockdown:devices/klaxon/alarm_stop
execute if block ~ ~ ~ minecraft:note_block[note=7,powered=true] run setblock ~ ~ ~ minecraft:note_block[note=0,powered=true]
execute if block ~ ~ ~ minecraft:note_block[note=7,powered=false] run setblock ~ ~ ~ minecraft:note_block[note=0,powered=false]
execute if entity @s[tag=ld_alarmed] run function lockdown:devices/klaxon/alarm_timer
execute unless block ~ ~ ~ minecraft:note_block run function lockdown:devices/klaxon/klaxon_destroy
