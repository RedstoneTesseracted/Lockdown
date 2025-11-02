# This function ejects items that are not meant to be in the gui.  This function isn't intended to be run continuously.
# Save items that must be ejected
execute unless block ~ ~ ~ minecraft:barrel{Items:[{Slot:0b,tag:{LockdownDelete:2b}}]} run data modify storage lockdown:temp Items append from block ~ ~ ~ Items[{Slot:0b}]
execute unless block ~ ~ ~ minecraft:barrel{Items:[{Slot:4b,tag:{LockdownDelete:2b}}]} run data modify storage lockdown:temp Items append from block ~ ~ ~ Items[{Slot:4b}]
execute unless block ~ ~ ~ minecraft:barrel{Items:[{Slot:5b,tag:{LockdownDelete:2b}}]} run data modify storage lockdown:temp Items append from block ~ ~ ~ Items[{Slot:5b}]
execute unless block ~ ~ ~ minecraft:barrel{Items:[{Slot:6b,tag:{LockdownDelete:2b}}]} run data modify storage lockdown:temp Items append from block ~ ~ ~ Items[{Slot:6b}]
execute unless block ~ ~ ~ minecraft:barrel{Items:[{Slot:7b,tag:{LockdownDelete:2b}}]} run data modify storage lockdown:temp Items append from block ~ ~ ~ Items[{Slot:7b}]
execute unless block ~ ~ ~ minecraft:barrel{Items:[{Slot:8b,tag:{LockdownDelete:2b}}]} run data modify storage lockdown:temp Items append from block ~ ~ ~ Items[{Slot:8b}]
execute unless block ~ ~ ~ minecraft:barrel{Items:[{Slot:9b,tag:{LockdownDelete:2b}}]} run data modify storage lockdown:temp Items append from block ~ ~ ~ Items[{Slot:9b}]
execute unless block ~ ~ ~ minecraft:barrel{Items:[{Slot:13b,tag:{LockdownDelete:2b}}]} run data modify storage lockdown:temp Items append from block ~ ~ ~ Items[{Slot:13b}]
execute unless block ~ ~ ~ minecraft:barrel{Items:[{Slot:14b,tag:{LockdownDelete:2b}}]} run data modify storage lockdown:temp Items append from block ~ ~ ~ Items[{Slot:14b}]
execute unless block ~ ~ ~ minecraft:barrel{Items:[{Slot:15b,tag:{LockdownDelete:2b}}]} run data modify storage lockdown:temp Items append from block ~ ~ ~ Items[{Slot:15b}]
execute unless block ~ ~ ~ minecraft:barrel{Items:[{Slot:17b,tag:{LockdownDelete:2b}}]} run data modify storage lockdown:temp Items append from block ~ ~ ~ Items[{Slot:17b}]
execute unless block ~ ~ ~ minecraft:barrel{Items:[{Slot:18b,tag:{LockdownDelete:2b}}]} run data modify storage lockdown:temp Items append from block ~ ~ ~ Items[{Slot:18b}]
execute unless block ~ ~ ~ minecraft:barrel{Items:[{Slot:22b,tag:{LockdownDelete:2b}}]} run data modify storage lockdown:temp Items append from block ~ ~ ~ Items[{Slot:22b}]
execute unless block ~ ~ ~ minecraft:barrel{Items:[{Slot:23b,tag:{LockdownDelete:2b}}]} run data modify storage lockdown:temp Items append from block ~ ~ ~ Items[{Slot:23b}]
execute unless block ~ ~ ~ minecraft:barrel{Items:[{Slot:24b,tag:{LockdownDelete:2b}}]} run data modify storage lockdown:temp Items append from block ~ ~ ~ Items[{Slot:24b}]
execute unless block ~ ~ ~ minecraft:barrel{Items:[{Slot:25b,tag:{LockdownDelete:2b}}]} run data modify storage lockdown:temp Items append from block ~ ~ ~ Items[{Slot:25b}]
execute unless block ~ ~ ~ minecraft:barrel{Items:[{Slot:26b,tag:{LockdownDelete:2b}}]} run data modify storage lockdown:temp Items append from block ~ ~ ~ Items[{Slot:26b}]

# For the special case of slot 23 (24), run the crafting function as well
execute unless block ~ ~ ~ minecraft:barrel{Items:[{Slot:23b,tag:{LockdownDelete:2b}}]} run function lockdown:devices/crafter/craft_item

# Place the correct items back in the gui
item replace block ~ ~ ~ container.0 with minecraft:rabbit_foot{CustomModelData:10062,display:{Name:'{"text":""}'},LockdownDelete:2b}
item replace block ~ ~ ~ container.4 with minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}
item replace block ~ ~ ~ container.5 with minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}
item replace block ~ ~ ~ container.6 with minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}
item replace block ~ ~ ~ container.7 with minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}
item replace block ~ ~ ~ container.8 with minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}
item replace block ~ ~ ~ container.9 with minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}
item replace block ~ ~ ~ container.13 with minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}
item replace block ~ ~ ~ container.14 with minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}
item replace block ~ ~ ~ container.15 with minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}
item replace block ~ ~ ~ container.17 with minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}
item replace block ~ ~ ~ container.18 with minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}
item replace block ~ ~ ~ container.22 with minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}
item replace block ~ ~ ~ container.23 with minecraft:rabbit_foot{CustomModelData:10060,display:{Name:'{"text":"Craft","color":"green","italic":"false"}'},LockdownDelete:2b}
item replace block ~ ~ ~ container.24 with minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}
item replace block ~ ~ ~ container.25 with minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}
item replace block ~ ~ ~ container.26 with minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}

# Run the generic item ejector if any unauthorized items were inserted into the inventory
execute store result score $ld_result ld_result run data get storage lockdown:temp Items
execute if score $ld_result ld_result matches 1.. run function lockdown:devices/generic_eject_item

# Remove the "reset gui" indicator
tag @s remove ld_reset_gui
