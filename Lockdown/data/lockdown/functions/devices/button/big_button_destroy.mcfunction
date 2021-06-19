# Mark the dropped item for replacement
tag @e[type=item,distance=..5,limit=1,sort=nearest,nbt={Item:{id:"minecraft:acacia_button"}}] add ld_replace_item

# Give the item its name
execute store result score @s ld_item_model run data get entity @s ArmorItems[3].tag.LockdownData.item_model
execute if score @s ld_item_model matches 10026 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Big White Button","italic":"false","color":"white"}'
execute if score @s ld_item_model matches 10027 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Big Orange Button","italic":"false","color":"gold"}'
execute if score @s ld_item_model matches 10028 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Big Magenta Button","italic":"false","color":"light_purple"}'
execute if score @s ld_item_model matches 10029 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Big Light Blue Button","italic":"false","color":"blue"}'
execute if score @s ld_item_model matches 10030 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Big Yellow Button","italic":"false","color":"yellow"}'
execute if score @s ld_item_model matches 10031 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Big Lime Button","italic":"false","color":"green"}'
execute if score @s ld_item_model matches 10032 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Big Pink Button","italic":"false","color":"light_purple"}'
execute if score @s ld_item_model matches 10033 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Big Gray Button","italic":"false","color":"dark_gray"}'
execute if score @s ld_item_model matches 10034 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Big Light Gray Button","italic":"false","color":"gray"}'
execute if score @s ld_item_model matches 10035 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Big Cyan Button","italic":"false","color":"dark_aqua"}'
execute if score @s ld_item_model matches 10036 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Big Purple Button","italic":"false","color":"dark_purple"}'
execute if score @s ld_item_model matches 10037 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Big Blue Button","italic":"false","color":"dark_blue"}'
execute if score @s ld_item_model matches 10038 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Big Brown Button","italic":"false","color":"gold"}'
execute if score @s ld_item_model matches 10039 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Big Green Button","italic":"false","color":"dark_green"}'
execute if score @s ld_item_model matches 10040 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Big Red Button","italic":"false","color":"red"}'
execute if score @s ld_item_model matches 10041 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Name set value '{"text":"Big Black Button","italic":"false","color":"dark_gray"}'

# Set item lore
execute if score @s ld_channel matches 0 run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Lore set value ['{"text":"No Channel Assigned","color":"red"}']
execute if score @s ld_channel matches 1.. run data modify entity @e[tag=ld_replace_item,limit=1,sort=nearest] Item.tag.display.Lore set value ['{"text":"Channel Assigned","color":"green","italic":"false"}']

# Update channels
tag @s remove ld_sending
function lockdown:devices/update_channels

# Apply the generic custom block removal
function lockdown:devices/generic_destroy
