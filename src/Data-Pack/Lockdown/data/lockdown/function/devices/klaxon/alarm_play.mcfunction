execute if block ~ ~ ~ minecraft:note_block[note=0] run playsound lockdown:alarm.alarm2 block @a[distance=..50] ~ ~ ~ 4.0 1.0
execute if block ~ ~ ~ minecraft:note_block[note=1] run playsound lockdown:alarm.alarm1 block @a[distance=..50] ~ ~ ~ 4.0 1.0
execute if block ~ ~ ~ minecraft:note_block[note=2] run playsound minecraft:entity.elder_guardian.curse block @a[distance=..50] ~ ~ ~ 4.0 0.75
execute if block ~ ~ ~ minecraft:note_block[note=3] run playsound minecraft:entity.elder_guardian.curse block @a[distance=..50] ~ ~ ~ 4.0 1.25
execute if block ~ ~ ~ minecraft:note_block[note=4] run playsound lockdown:alarm.industrial_alarm block @a[distance=..50] ~ ~ ~ 4.0 1.0
execute if block ~ ~ ~ minecraft:note_block[note=5] run playsound lockdown:alarm.spaceship_alarm block @a[distance=..50] ~ ~ ~ 4.0 1.0
execute if block ~ ~ ~ minecraft:note_block[note=6] run playsound minecraft:entity.guardian.death block @a[distance=..50] ~ ~ ~ 4.0 1.5
execute if block ~ ~ ~ minecraft:note_block[note=7] run playsound minecraft:block.bell.use block @a[distance=..50] ~ ~ ~ 4.0 1.0
execute if block ~ ~ ~ minecraft:note_block[note=8] run playsound minecraft:block.bell.use block @a[distance=..50] ~ ~ ~ 4.0 0.5
scoreboard players set @s lockdown.time 0
