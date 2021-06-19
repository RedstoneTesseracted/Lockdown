# Mark the dropped item for replacement
tag @e[type=item,distance=..1,limit=1,sort=nearest,nbt={Item:{id:"minecraft:note_block"}}] add ld_replace_item

# Give the item its name
data merge entity @e[tag=ld_replace_item,limit=1,sort=nearest] {Item:{tag:{display:{Name:'{"text":"Laser Projector","italic":"false"}'}}}}

# Apply the generic custom block removal
function lockdown:devices/generic_destroy
