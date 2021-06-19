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
replaceitem block ~ ~ ~ container.0 minecraft:rabbit_foot{CustomModelData:10062,display:{Name:'{"text":""}'},LockdownDelete:2b}
replaceitem block ~ ~ ~ container.4 minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}
replaceitem block ~ ~ ~ container.5 minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}
replaceitem block ~ ~ ~ container.6 minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}
replaceitem block ~ ~ ~ container.7 minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}
replaceitem block ~ ~ ~ container.8 minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}
replaceitem block ~ ~ ~ container.9 minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}
replaceitem block ~ ~ ~ container.13 minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}
replaceitem block ~ ~ ~ container.14 minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}
replaceitem block ~ ~ ~ container.15 minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}
replaceitem block ~ ~ ~ container.17 minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}
replaceitem block ~ ~ ~ container.18 minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}
replaceitem block ~ ~ ~ container.22 minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}
replaceitem block ~ ~ ~ container.23 minecraft:rabbit_foot{CustomModelData:10060,display:{Name:'{"text":"Craft","color":"green","italic":"false"}'},LockdownDelete:2b}
replaceitem block ~ ~ ~ container.24 minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}
replaceitem block ~ ~ ~ container.25 minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}
replaceitem block ~ ~ ~ container.26 minecraft:rabbit_foot{CustomModelData:10061,display:{Name:'{"text":""}'},LockdownDelete:2b}

# Run the generic item ejector if any unauthorized items were inserted into the inventory
execute store result score $ld_result ld_result run data get storage lockdown:temp Items
execute if score $ld_result ld_result matches 1.. run function lockdown:devices/generic_eject_item

