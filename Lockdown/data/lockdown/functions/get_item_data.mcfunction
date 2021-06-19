execute store result score @s ld_id run data get entity @s SelectedItem.tag.LockdownData.id
execute store result score @s ld_block_model run data get entity @s SelectedItem.tag.LockdownData.block_model
execute store result score @s ld_item_model run data get entity @s SelectedItem.tag.LockdownData.item_model
execute store result score @s ld_block_id run data get entity @s SelectedItem.tag.LockdownData.block_id
execute store result score @s ld_item_id run data get entity @s SelectedItem.tag.LockdownData.item_id
execute store result score @s ld_fun_model run data get entity @s SelectedItem.tag.LockdownData.function_model
execute store result score @s ld_channel_id run data get entity @s SelectedItem.tag.LockdownData.channel
scoreboard players operation @s[scores={ld_channel_id=0..,ld_id=4}] ld_last_channel = @s ld_channel_id
