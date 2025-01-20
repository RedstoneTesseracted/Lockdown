# Mark the dropped item for replacement
execute if entity @s[tag=ld_found_player] run tag @e[type=item,distance=..1,limit=1,sort=nearest,nbt={Item:{id:"minecraft:redstone_block"}}] add ld_replace_item
execute unless entity @s[tag=ld_found_player] run tag @e[type=item,distance=..1,limit=1,sort=nearest,nbt={Item:{id:"minecraft:light_gray_glazed_terracotta"}}] add ld_replace_item

# Give the item its name
data merge entity @e[tag=ld_replace_item,limit=1,sort=nearest] {Item:{tag:{display:{Name:'{"text":"Player Detector","italic":"false"}'}}}}

# Apply the generic custom block removal
function lockdown:devices/generic_destroy
