execute if block ~ ~ ~ minecraft:note_block[powered=true] if entity @s[tag=!ld_pew] run function lockdown:devices/laser/laser_activate
execute if block ~ ~ ~ minecraft:note_block[powered=false] if entity @s[tag=ld_pew] run function lockdown:devices/laser/laser_stop
execute if entity @s[tag=ld_pew] run function lockdown:devices/laser/laser_fire
execute unless block ~ ~ ~ #lockdown:redstone_input run function lockdown:devices/laser/laser_destroy
