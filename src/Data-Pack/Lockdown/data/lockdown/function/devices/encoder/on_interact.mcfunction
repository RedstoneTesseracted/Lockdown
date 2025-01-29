# This function runs whenever the GUI was been interacted with such that 
# one of the forbidden items have changed

# How about NO
kill @e[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{lockdown_data:{forbidden:1b}}}}}]
clear @a *[minecraft:custom_data~{lockdown_data:{forbidden:1b}}]
execute as @a if items entity @s player.cursor *[minecraft:custom_data~{lockdown_data:{forbidden:1b}}] run item replace entity @s player.cursor with minecraft:air

# Attempt to encode item if button was clicked
execute unless items block ~ ~ ~ container.5 *[minecraft:custom_data~{lockdown_data:{slot:5b}}] run function lockdown:devices/encoder/encode_item


# Eject invalid items
execute if data block ~ ~ ~ Items[{Slot:0b}] if items block ~ ~ ~ container.0 *[!minecraft:custom_data~{lockdown_data:{forbidden:1b, slot:0b}}] run summon minecraft:item ~ ~1 ~ {Tags:["lockdown.ejected_item"],Item:{id:"minecraft:paper",components:{"minecraft:item_model":"lockdown:invisible","minecraft:custom_data":{lockdown_data:{forbidden:1b}}}}}
execute if data block ~ ~ ~ Items[{Slot:0b}] if items block ~ ~ ~ container.0 *[!minecraft:custom_data~{lockdown_data:{forbidden:1b, slot:0b}}] run item replace entity @n[tag=lockdown.ejected_item] container.0 from block ~ ~ ~ container.0
tag @e[tag=lockdown.ejected_item] remove lockdown.ejected_item
execute if data block ~ ~ ~ Items[{Slot:0b}] if items block ~ ~ ~ container.0 *[!minecraft:custom_data~{lockdown_data:{forbidden:1b, slot:0b}}] run item replace block ~ ~ ~ container.0 with minecraft:air

execute if data block ~ ~ ~ Items[{Slot:1b}] if items block ~ ~ ~ container.1 *[!minecraft:custom_data~{lockdown_data:{forbidden:1b, slot:1b}}] run summon minecraft:item ~ ~1 ~ {Tags:["lockdown.ejected_item"],Item:{id:"minecraft:paper",components:{"minecraft:item_model":"lockdown:invisible","minecraft:custom_data":{lockdown_data:{forbidden:1b}}}}}
execute if data block ~ ~ ~ Items[{Slot:1b}] if items block ~ ~ ~ container.1 *[!minecraft:custom_data~{lockdown_data:{forbidden:1b, slot:1b}}] run item replace entity @n[tag=lockdown.ejected_item] container.0 from block ~ ~ ~ container.1
tag @e[tag=lockdown.ejected_item] remove lockdown.ejected_item
execute if data block ~ ~ ~ Items[{Slot:1b}] if items block ~ ~ ~ container.1 *[!minecraft:custom_data~{lockdown_data:{forbidden:1b, slot:1b}}] run item replace block ~ ~ ~ container.1 with minecraft:air

execute if data block ~ ~ ~ Items[{Slot:2b}] if items block ~ ~ ~ container.2 *[!minecraft:custom_data~{lockdown_data:{forbidden:1b, slot:2b}}] run summon minecraft:item ~ ~1 ~ {Tags:["lockdown.ejected_item"],Item:{id:"minecraft:paper",components:{"minecraft:item_model":"lockdown:invisible","minecraft:custom_data":{lockdown_data:{forbidden:1b}}}}}
execute if data block ~ ~ ~ Items[{Slot:2b}] if items block ~ ~ ~ container.2 *[!minecraft:custom_data~{lockdown_data:{forbidden:1b, slot:2b}}] run item replace entity @n[tag=lockdown.ejected_item] container.0 from block ~ ~ ~ container.2
tag @e[tag=lockdown.ejected_item] remove lockdown.ejected_item
execute if data block ~ ~ ~ Items[{Slot:2b}] if items block ~ ~ ~ container.2 *[!minecraft:custom_data~{lockdown_data:{forbidden:1b, slot:2b}}] run item replace block ~ ~ ~ container.2 with minecraft:air

execute if data block ~ ~ ~ Items[{Slot:3b}] if items block ~ ~ ~ container.3 *[!minecraft:custom_data~{lockdown_data:{forbidden:1b, slot:3b}}] run summon minecraft:item ~ ~1 ~ {Tags:["lockdown.ejected_item"],Item:{id:"minecraft:paper",components:{"minecraft:item_model":"lockdown:invisible","minecraft:custom_data":{lockdown_data:{forbidden:1b}}}}}
execute if data block ~ ~ ~ Items[{Slot:3b}] if items block ~ ~ ~ container.3 *[!minecraft:custom_data~{lockdown_data:{forbidden:1b, slot:3b}}] run item replace entity @n[tag=lockdown.ejected_item] container.0 from block ~ ~ ~ container.3
tag @e[tag=lockdown.ejected_item] remove lockdown.ejected_item
execute if data block ~ ~ ~ Items[{Slot:3b}] if items block ~ ~ ~ container.3 *[!minecraft:custom_data~{lockdown_data:{forbidden:1b, slot:3b}}] run item replace block ~ ~ ~ container.3 with minecraft:air

execute if data block ~ ~ ~ Items[{Slot:5b}] if items block ~ ~ ~ container.5 *[!minecraft:custom_data~{lockdown_data:{forbidden:1b, slot:5b}}] run summon minecraft:item ~ ~1 ~ {Tags:["lockdown.ejected_item"],Item:{id:"minecraft:paper",components:{"minecraft:item_model":"lockdown:invisible","minecraft:custom_data":{lockdown_data:{forbidden:1b}}}}}
execute if data block ~ ~ ~ Items[{Slot:5b}] if items block ~ ~ ~ container.5 *[!minecraft:custom_data~{lockdown_data:{forbidden:1b, slot:5b}}] run item replace entity @n[tag=lockdown.ejected_item] container.0 from block ~ ~ ~ container.5
tag @e[tag=lockdown.ejected_item] remove lockdown.ejected_item
execute if data block ~ ~ ~ Items[{Slot:5b}] if items block ~ ~ ~ container.5 *[!minecraft:custom_data~{lockdown_data:{forbidden:1b, slot:5b}}] run item replace block ~ ~ ~ container.5 with minecraft:air


# Restore contents
function lockdown:devices/encoder/restore_gui
