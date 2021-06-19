# Mark the dropped item for replacement
tag @e[type=item,distance=..1,limit=1,sort=nearest,nbt={Item:{id:"minecraft:barrel"}}] add ld_replace_item
kill @e[type=item,nbt={Item:{tag:{LockdownDelete:2b}}}]

# Give the item its name
data merge entity @e[tag=ld_replace_item,limit=1,sort=nearest] {Item:{tag:{display:{Name:'{"text":"Secure Crafting Table","italic":"false"}'}}}}

# Apply the generic custom block removal
function lockdown:devices/generic_destroy
