#execute if block ~ ~ ~ minecraft:barrel[open=true] if entity @s[tag=!ld_crafter_open] run function lockdown:devices/crafter/crafter_open
#execute if block ~ ~ ~ minecraft:barrel[open=false] if entity @s[tag=ld_crafter_open] run function lockdown:devices/crafter/crafter_close
scoreboard players set @s ld_result 0
execute store result score @s ld_result run clear @a[distance=..5] minecraft:rabbit_foot{LockdownDelete:2b}
execute if score @s ld_result matches 1.. run tag @e[type=armor_stand,tag=ld_crafter] add ld_reset_gui
execute if entity @s[tag=ld_reset_gui] run function lockdown:devices/crafter/eject_item
execute unless block ~ ~ ~ minecraft:barrel run function lockdown:devices/crafter/crafter_destroy
