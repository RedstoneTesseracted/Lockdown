# The root klaxon function

# Start/stop alarm as needed
execute if block ~ ~ ~ minecraft:note_block[powered=true] if entity @s[tag=!lockdown.powered] run function lockdown:devices/klaxon/start
execute if block ~ ~ ~ minecraft:note_block[powered=false] if entity @s[tag=lockdown.powered] run function lockdown:devices/klaxon/stop

# Cycle alarm number
execute if block ~ ~ ~ minecraft:note_block[note=9,powered=true] run setblock ~ ~ ~ minecraft:note_block[note=0,powered=true]
execute if block ~ ~ ~ minecraft:note_block[note=9,powered=false] run setblock ~ ~ ~ minecraft:note_block[note=0,powered=false]

# Execute alarm
execute if entity @s[tag=lockdown.powered] run function lockdown:devices/klaxon/alarm_timer

# Run destroy function if block was destroyed
execute unless block ~ ~ ~ minecraft:note_block run function lockdown:devices/klaxon/destroy
