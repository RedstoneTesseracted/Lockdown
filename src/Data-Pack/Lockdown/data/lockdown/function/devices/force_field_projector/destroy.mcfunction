# Ensure that the force field is disabled
execute if entity @s[tag=lockdown.projecting] run function lockdown:devices/force_field_projector/deactivate

# Destroy the dropped item
kill @n[type=minecraft:item,distance=..1,nbt={Item:{id:"minecraft:note_block"}}]

# Summon the correct dropped item
execute align xyz run loot spawn ~0.5 ~0.5 ~0.5 loot lockdown:item/force_field_projector

# Common block removal functionality
function lockdown:devices/common_destroy
