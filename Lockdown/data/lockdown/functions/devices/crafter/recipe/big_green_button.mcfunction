# Determine how many items (Big Green Button) can be crafted
execute store result score $ld_result ld_result run data get block ~ ~ ~ Items[{Slot:10b}].Count
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
replaceitem block ~ ~ ~ container.16 birch_button{LockdownItem:1b,LockdownData:{id:6,function_model:10023,block_model:10039,item_model:10039,block_id:1,item_id:1,channel:0},CustomModelData:10039,display:{Name:'{"text":"Big Green Button","italic":"false","color":"dark_green"}',Lore:['{"text":"No Channel Assigned","color":"red"}']}}
execute store result block ~ ~ ~ Items[{Slot:16b}].Count byte 1 run scoreboard players get $ld_result ld_result
# Remove the calculated number of used items
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