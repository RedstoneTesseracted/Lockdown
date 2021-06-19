# Mark the dropped item for replacement
tag @e[type=item,distance=..1,limit=1,sort=nearest,nbt={Item:{id:"minecraft:note_block"}}] add ld_replace_item

# Give the item its name
execute if score @s ld_channel matches 0 run data merge entity @e[tag=ld_replace_item,limit=1,sort=nearest] {Item:{tag:{display:{Name:'{"text":"Redstone Transmitter","italic":"false"}',Lore:['{"text":"No Channel Assigned","color":"red"}']}}}}
execute if score @s ld_channel matches 1.. run data merge entity @e[tag=ld_replace_item,limit=1,sort=nearest] {Item:{tag:{display:{Name:'{"text":"Redstone Transmitter","italic":"false"}',Lore:['{"text":"Channel Assigned","color":"green","italic":"false"}']}}}}

# Update channels
function lockdown:devices/update_channels

# Apply the generic custom block removal
tag @s remove ld_sending
function lockdown:devices/generic_destroy
