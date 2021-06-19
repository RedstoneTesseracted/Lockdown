# Ensure that the force field is disabled
execute if entity @s[tag=ld_projecting] run function lockdown:devices/force_field/field_off

# Mark the dropped item for replacement
tag @e[type=item,distance=..1,limit=1,sort=nearest,nbt={Item:{id:"minecraft:note_block"}}] add ld_replace_item

# Give the item its name
data merge entity @e[tag=ld_replace_item,limit=1,sort=nearest] {Item:{tag:{display:{Name:'{"text":"Force Field Projector","italic":"false","color":"aqua"}'}}}}

# Apply the generic custom block removal
tag @s remove ld_sending
function lockdown:devices/generic_destroy
