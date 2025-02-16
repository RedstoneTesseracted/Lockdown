# This function is called whenever the player uses a key

# Play effects
playsound minecraft:block.chest.locked block @a ~ ~ ~ 1.0 2.0

# Get channel from key
execute store result score lockdown.held_code lockdown.local run data get entity @s SelectedItem.components."minecraft:custom_data".lockdown_data.channel

# Abort if no channel assigned
execute if score lockdown.held_code lockdown.local matches 0 run title @s actionbar {"translate": "lockdown.messages.key.no_code","color":"red"}
execute if score lockdown.held_code lockdown.local matches 0 run return 0

# Find the block that the player was trying to interact with and give it a lock (if possible)
data modify storage lockdown:temp args set value {channel: 0}
execute store result storage lockdown:temp args.channel int 1 run scoreboard players get lockdown.held_code lockdown.local
function lockdown:items/key/build_predicate with storage lockdown:temp args
#data remove storage lockdown:temp key.lock
#data modify storage lockdown:temp key.lock set value {predicates:{"minecraft:custom_data":{lockdown_data:{channel: 0}}}}
#execute store result storage lockdown:temp key.lock.predicates."minecraft:custom_data".lockdown_data.channel int 1 run scoreboard players get lockdown.held_code lockdown.local
execute store result score lockdown.success lockdown.local run function lockdown:items/key/raycast_search

# Notify player if no container could be found
execute if score lockdown.success lockdown.local matches -1 run title @s actionbar {"translate": "lockdown.messages.key.not_a_container","color":"red"}
