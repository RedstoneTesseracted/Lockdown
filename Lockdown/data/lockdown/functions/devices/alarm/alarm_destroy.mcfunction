# Mark the dropped item for replacement
tag @e[type=item,distance=..5,limit=1,sort=nearest,nbt={Item:{id:"minecraft:acacia_button"}}] add ld_replace_item

# Give the item its name
execute store result score @s ld_item_model run data get entity @s ArmorItems[3].tag.LockdownData.item_model
execute if score @s ld_item_model matches 10042 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"White Alarm","italic":"false","color":"white"}'
execute if score @s ld_item_model matches 10043 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Orange Alarm","italic":"false","color":"gold"}'
execute if score @s ld_item_model matches 10044 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Magenta Alarm","italic":"false","color":"light_purple"}'
execute if score @s ld_item_model matches 10045 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Big Light Blue Button","italic":"false","color":"blue"}'
execute if score @s ld_item_model matches 10046 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Yellow Alarm","italic":"false","color":"yellow"}'
execute if score @s ld_item_model matches 10047 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Lime Alarm","italic":"false","color":"green"}'
execute if score @s ld_item_model matches 10048 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Pink Alarm","italic":"false","color":"light_purple"}'
execute if score @s ld_item_model matches 10049 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Gray Alarm","italic":"false","color":"dark_gray"}'
execute if score @s ld_item_model matches 10050 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Big Light Gray Button","italic":"false","color":"gray"}'
execute if score @s ld_item_model matches 10051 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Cyan Alarm","italic":"false","color":"dark_aqua"}'
execute if score @s ld_item_model matches 10052 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Purple Alarm","italic":"false","color":"dark_purple"}'
execute if score @s ld_item_model matches 10053 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Blue Alarm","italic":"false","color":"dark_blue"}'
execute if score @s ld_item_model matches 10054 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Brown Alarm","italic":"false","color":"gold"}'
execute if score @s ld_item_model matches 10055 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Green Alarm","italic":"false","color":"dark_green"}'
execute if score @s ld_item_model matches 10056 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Red Alarm","italic":"false","color":"red"}'
execute if score @s ld_item_model matches 10057 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Black Alarm","italic":"false","color":"dark_gray"}'

# Set item lore
execute if score @s ld_channel matches 0 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Lore set value ['{"text":"No Channel Assigned","color":"red"}']
execute if score @s ld_channel matches 1.. run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Lore set value ['{"text":"Channel Assigned","color":"green","italic":"false"}']

# Apply the generic custom block removal
function lockdown:devices/generic_destroy
