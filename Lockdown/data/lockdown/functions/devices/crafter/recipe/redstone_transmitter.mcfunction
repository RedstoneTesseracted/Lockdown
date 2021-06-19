# Determine how many items (Redstone Transmitter) can be crafted
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
replaceitem block ~ ~ ~ container.16 gray_glazed_terracotta{LockdownItem:1b,LockdownData:{id:12,function_model:10009,block_model:10008,item_model:10008,block_id:3,item_id:3,channel:0},CustomModelData:10008,display:{Name:'{"text":"Redstone Transmitter","italic":"false"}',Lore:['{"text":"No Channel Assigned","color":"red"}']}}
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
