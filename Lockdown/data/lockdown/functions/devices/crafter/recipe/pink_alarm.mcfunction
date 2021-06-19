# Determine how many items (Pink Alarm) can be crafted
execute store result score $ld_result ld_result run data get block ~ ~ ~ Items[{Slot:1b}].Count
execute store result score $ld_var ld_result run data get block ~ ~ ~ Items[{Slot:2b}].Count
scoreboard players operation $ld_result ld_result < $ld_var ld_result
execute store result score $ld_var ld_result run data get block ~ ~ ~ Items[{Slot:3b}].Count
scoreboard players operation $ld_result ld_result < $ld_var ld_result
execute store result score $ld_var ld_result run data get block ~ ~ ~ Items[{Slot:10b}].Count
scoreboard players operation $ld_result ld_result < $ld_var ld_result
execute store result score $ld_var ld_result run data get block ~ ~ ~ Items[{Slot:11b}].Count
scoreboard players operation $ld_result ld_result < $ld_var ld_result
execute store result score $ld_var ld_result run data get block ~ ~ ~ Items[{Slot:12b}].Count
scoreboard players operation $ld_result ld_result < $ld_var ld_result
execute store result score $ld_var ld_result run data get block ~ ~ ~ Items[{Slot:19b}].Count
scoreboard players operation $ld_result ld_result < $ld_var ld_result
execute store result score $ld_var ld_result run data get block ~ ~ ~ Items[{Slot:20b}].Count
scoreboard players operation $ld_result ld_result < $ld_var ld_result
execute store result score $ld_var ld_result run data get block ~ ~ ~ Items[{Slot:21b}].Count
scoreboard players operation $ld_result ld_result < $ld_var ld_result

# Output the calculated number of items
replaceitem block ~ ~ ~ container.16 birch_button{LockdownItem:1b,LockdownData:{id:5,function_model:10006,block_model:10022,item_model:10048,block_id:2,item_id:1,channel:0},CustomModelData:10048,display:{Name:'{"text":"Pink Alarm","italic":"false","color":"light_purple"}',Lore:['{"text":"No Channel Assigned","color":"red"}']}}
execute store result block ~ ~ ~ Items[{Slot:16b}].Count byte 1 run scoreboard players get $ld_result ld_result
# Remove the calculated number of used items
execute store result score $ld_var ld_result run data get block ~ ~ ~ Items[{Slot:1b}].Count
scoreboard players operation $ld_var ld_result -= $ld_result ld_result
execute store result block ~ ~ ~ Items[{Slot:1b}].Count byte 1 run scoreboard players get $ld_var ld_result
execute store result score $ld_var ld_result run data get block ~ ~ ~ Items[{Slot:2b}].Count
scoreboard players operation $ld_var ld_result -= $ld_result ld_result
execute store result block ~ ~ ~ Items[{Slot:2b}].Count byte 1 run scoreboard players get $ld_var ld_result
execute store result score $ld_var ld_result run data get block ~ ~ ~ Items[{Slot:3b}].Count
scoreboard players operation $ld_var ld_result -= $ld_result ld_result
execute store result block ~ ~ ~ Items[{Slot:3b}].Count byte 1 run scoreboard players get $ld_var ld_result
execute store result score $ld_var ld_result run data get block ~ ~ ~ Items[{Slot:10b}].Count
scoreboard players operation $ld_var ld_result -= $ld_result ld_result
execute store result block ~ ~ ~ Items[{Slot:10b}].Count byte 1 run scoreboard players get $ld_var ld_result
execute store result score $ld_var ld_result run data get block ~ ~ ~ Items[{Slot:11b}].Count
scoreboard players operation $ld_var ld_result -= $ld_result ld_result
execute store result block ~ ~ ~ Items[{Slot:11b}].Count byte 1 run scoreboard players get $ld_var ld_result
execute store result score $ld_var ld_result run data get block ~ ~ ~ Items[{Slot:12b}].Count
scoreboard players operation $ld_var ld_result -= $ld_result ld_result
execute store result block ~ ~ ~ Items[{Slot:12b}].Count byte 1 run scoreboard players get $ld_var ld_result
execute store result score $ld_var ld_result run data get block ~ ~ ~ Items[{Slot:19b}].Count
scoreboard players operation $ld_var ld_result -= $ld_result ld_result
execute store result block ~ ~ ~ Items[{Slot:19b}].Count byte 1 run scoreboard players get $ld_var ld_result
execute store result score $ld_var ld_result run data get block ~ ~ ~ Items[{Slot:20b}].Count
scoreboard players operation $ld_var ld_result -= $ld_result ld_result
execute store result block ~ ~ ~ Items[{Slot:20b}].Count byte 1 run scoreboard players get $ld_var ld_result
execute store result score $ld_var ld_result run data get block ~ ~ ~ Items[{Slot:21b}].Count
scoreboard players operation $ld_var ld_result -= $ld_result ld_result
execute store result block ~ ~ ~ Items[{Slot:21b}].Count byte 1 run scoreboard players get $ld_var ld_result

# Report crafting as successful
scoreboard players set $ld_success ld_success 1