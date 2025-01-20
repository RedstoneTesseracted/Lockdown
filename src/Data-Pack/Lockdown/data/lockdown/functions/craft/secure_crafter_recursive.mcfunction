# This function repeatedly removes spawn eggs from the player's inventory, replacing them with secure crafting tables
execute store success score @s ld_result run clear @s minecraft:polar_bear_spawn_egg 1
execute if score @s ld_result matches 1 run give @s minecraft:gray_glazed_terracotta{LockdownItem:1b,LockdownData:{id:17,function_model:10015,block_model:10015,item_model:10015,block_id:3,item_id:3,channel:-1},CustomModelData:10015,display:{Name:'{"text":"Secure Crafting Table","italic":"false"}'}}
execute if score @s ld_result matches 1 run function lockdown:craft/secure_crafter_recursive
