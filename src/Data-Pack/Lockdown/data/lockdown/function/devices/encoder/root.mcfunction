# scoreboard players set @s ld_result 0
# execute store result score @s ld_result run clear @a[distance=..5] minecraft:rabbit_foot{LockdownDelete:1b}
# execute if score @s ld_result matches 1.. run tag @e[type=armor_stand,tag=ld_encoder] add ld_reset_gui
# execute if entity @s[tag=ld_reset_gui] run function lockdown:devices/encoder/eject_item
execute unless block ~ ~ ~ minecraft:dispenser run function lockdown:devices/encoder/destroy
