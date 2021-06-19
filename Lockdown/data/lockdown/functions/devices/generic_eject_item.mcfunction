# Recursively iterate through a list of items that are to be ejected.
# Summon the item to be ejected and provide it with the relevant data.
summon item ~ ~ ~ {Tags:["ld_ejected_item"],Item:{id:"minecraft:stone",Count:1b,tag:{}}}
data modify entity @e[type=minecraft:item,limit=1,sort=nearest,tag=ld_ejected_item] Item.id set from storage lockdown:temp Items[0].id
data modify entity @e[type=minecraft:item,limit=1,sort=nearest,tag=ld_ejected_item] Item.Count set from storage lockdown:temp Items[0].Count
data modify entity @e[type=minecraft:item,limit=1,sort=nearest,tag=ld_ejected_item] Item.tag set from storage lockdown:temp Items[0].tag
tag @e[type=minecraft:item,limit=1,sort=nearest,tag=ld_ejected_item] remove ld_ejected_item

# Remove this item from the list
data remove storage lockdown:temp Items[0]

# Check whether there are still items left in the list.  If so, repeat this command
execute store result score $ld_result ld_result run data get storage lockdown:temp Items
execute if score $ld_result ld_result matches 1.. run function lockdown:devices/generic_eject_item
