# Function to check whether the item inserted into the encoder can actually be encoded
# Check if the item is eligible for channel assignment
scoreboard players set @s ld_result 0
execute store result score @s ld_result if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:4b,tag:{LockdownData:{}}}]} unless block ~ ~ ~ minecraft:dispenser{Items:[{Slot:4b,tag:{LockdownData:{channel:-1}}}]} run function lockdown:devices/encoder/check_dye

# If the encoding failed, inform the player and provide a reason (with the exception of the dye requirement)
execute if block ~ ~ ~ minecraft:dispenser unless score @s ld_result matches 111 run function lockdown:devices/encoder/encoder_feedback

# Assign a channel to the item if all the above conditions were met
execute if score @s ld_result matches 111 run function lockdown:devices/encoder/encode_item
