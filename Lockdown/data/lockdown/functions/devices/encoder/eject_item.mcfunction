# This function ejects items that are not meant to be in the gui.  This function shouldn't be needed to be run continuously.
execute store result score @s ld_result run data get block ~ ~ ~ Items[{Slot:0b}].tag.LockdownDelete
execute if score @s ld_result matches 0 run data modify storage lockdown:temp Items append from block ~ ~ ~ Items[{Slot:0b}]
execute if score @s ld_result matches 0 run replaceitem block ~ ~ ~ container.0 minecraft:rabbit_foot{CustomModelData:10059,display:{Name:'{"text":""}'},LockdownDelete:1b}

execute store result score @s ld_result run data get block ~ ~ ~ Items[{Slot:1b}].tag.LockdownDelete
execute if score @s ld_result matches 0 run data modify storage lockdown:temp Items append from block ~ ~ ~ Items[{Slot:1b}]
execute if score @s ld_result matches 0 run replaceitem block ~ ~ ~ container.1 minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:1b}

execute store result score @s ld_result run data get block ~ ~ ~ Items[{Slot:2b}].tag.LockdownDelete
execute if score @s ld_result matches 0 run data modify storage lockdown:temp Items append from block ~ ~ ~ Items[{Slot:2b}]
execute if score @s ld_result matches 0 run replaceitem block ~ ~ ~ container.2 minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:1b}

execute store result score @s ld_result run data get block ~ ~ ~ Items[{Slot:3b}].tag.LockdownDelete
execute if score @s ld_result matches 0 run data modify storage lockdown:temp Items append from block ~ ~ ~ Items[{Slot:3b}]
execute if score @s ld_result matches 0 run replaceitem block ~ ~ ~ container.3 minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:1b}

# For this case, the "write code" button was used, so run the encode function as well
execute store result score @s ld_result run data get block ~ ~ ~ Items[{Slot:5b}].tag.LockdownDelete
execute if score @s ld_result matches 0 run data modify storage lockdown:temp Items append from block ~ ~ ~ Items[{Slot:5b}]
execute if score @s ld_result matches 0 run replaceitem block ~ ~ ~ container.5 minecraft:rabbit_foot{CustomModelData:10060,display:{Name:'{"text":"Write Code","color":"green","italic":"false"}'},LockdownDelete:1b}
execute if score @s ld_result matches 0 run function lockdown:devices/encoder/check_item

# Run the generic item ejector if any unauthorized items were inserted into the inventory
execute store result score $ld_result ld_result run data get storage lockdown:temp Items
execute if score $ld_result ld_result matches 1.. run function lockdown:devices/generic_eject_item
