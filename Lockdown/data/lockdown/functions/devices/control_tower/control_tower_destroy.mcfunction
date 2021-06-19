# Mark the dropped item for replacement
tag @e[type=item,distance=..1,limit=1,sort=nearest,nbt={Item:{id:"minecraft:light_gray_glazed_terracotta"}}] add ld_replace_item

# Give the item its name
execute if score @s ld_channel matches 0 run data merge entity @e[tag=ld_replace_item,limit=1,sort=nearest] {Item:{tag:{display:{Name:'{"text":"Drone Control Tower","italic":"false"}',Lore:['{"text":"No Code Assigned","color":"red"}']}}}}
execute if score @s ld_channel matches 1.. run data merge entity @e[tag=ld_replace_item,limit=1,sort=nearest] {Item:{tag:{display:{Name:'{"text":"Drone Control Tower","italic":"false"}',Lore:['{"text":"Code Assigned","color":"green","italic":"false"}']}}}}

# Apply the generic custom block removal
tag @s remove ld_sending
function lockdown:devices/generic_destroy
