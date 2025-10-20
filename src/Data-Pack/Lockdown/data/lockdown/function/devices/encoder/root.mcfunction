# Restore GUI if needed
execute store result score lockdown.result lockdown.local run \
execute if items block ~ ~ ~ container.* *[\
minecraft:custom_data~{lockdown_data:{slot:0b}}|\
minecraft:custom_data~{lockdown_data:{slot:1b}}|\
minecraft:custom_data~{lockdown_data:{slot:2b}}|\
minecraft:custom_data~{lockdown_data:{slot:3b}}|\
minecraft:custom_data~{lockdown_data:{slot:5b}}]
execute unless score lockdown.result lockdown.local matches 5 run function lockdown:devices/encoder/on_interact

# Hoppers kinda break the GUI
execute if block ~ ~-1 ~ minecraft:hopper run setblock ~ ~-1 ~ minecraft:air destroy

execute unless block ~ ~ ~ minecraft:dropper run function lockdown:devices/encoder/destroy
