# Determine how many items (Lime Alarm) can be crafted
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
item replace block ~ ~ ~ container.16 with birch_button{LockdownItem:1b,LockdownData:{id:5,function_model:10005,block_model:10021,item_model:10047,block_id:2,item_id:1,channel:0},CustomModelData:10047,display:{Name:'{"text":"Lime Alarm","italic":"false","color":"green"}',Lore:['{"text":"No Channel Assigned","color":"red"}']}}
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
