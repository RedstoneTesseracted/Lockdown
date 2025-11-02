# This is a generic function to remove custom blocks after being broken.  It is intended to be run by the custom block's armor stand after tagging the item with ld_replace_item
# Transfer item data to the dropped item
execute store result score @s ld_item_id run data get entity @s ArmorItems[3].tag.LockdownData.item_id

execute if score @s ld_item_id matches 1 run data merge entity @e[tag=ld_replace_item,limit=1,sort=nearest] {Item:{id:"minecraft:birch_button",tag:{LockdownItem:1b,LockdownData:{}}}}
execute if score @s ld_item_id matches 2 run data merge entity @e[tag=ld_replace_item,limit=1,sort=nearest] {Item:{id:"minecraft:rabbit_foot",tag:{LockdownItem:1b,LockdownData:{}}}}
execute if score @s ld_item_id matches 3 run data merge entity @e[tag=ld_replace_item,limit=1,sort=nearest] {Item:{id:"minecraft:gray_glazed_terracotta",tag:{LockdownItem:1b,LockdownData:{}}}}

data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.CustomModelData set from entity @s ArmorItems[3].tag.LockdownData.item_model
data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.LockdownData set from entity @s ArmorItems[3].tag.LockdownData

# Remove the armor stand
kill @s[tag=ld_block,type=armor_stand]

# Remove the replacement tag
tag @e[type=item,tag=ld_replace_item] remove ld_replace_item
