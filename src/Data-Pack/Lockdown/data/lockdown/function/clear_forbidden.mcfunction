# This function clears all forbidden items (such as GUI items) from all player's inventories
# It is called using an advancement trigger

kill @e[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{lockdown_data:{forbidden:1b}}}}}]
clear @s *[minecraft:custom_data~{lockdown_data:{forbidden:1b}}]
advancement revoke @s only lockdown:hidden/forbidden
