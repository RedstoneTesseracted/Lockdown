# This function informs the player why the encoder failed to encode an item

# Play sound effect
playsound minecraft:block.note_block.didgeridoo block @a ~ ~ ~ 1 0

# No item was provided
execute store result score @s ld_result unless block ~ ~ ~ minecraft:dispenser{Items:[{Slot:4b}]} run tellraw @a[distance=..5] {"translate":"lockdown.messages.encoder.error.no_item","color":"red"}

# Item was not from this data pack
execute store result score @s ld_result if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:4b}]} unless block ~ ~ ~ minecraft:dispenser{Items:[{Slot:4b,tag:{LockdownData:{}}}]} run tellraw @a[distance=..5] {"translate":"lockdown.messages.encoder.error.not_encodable","color":"red"}

# Item was from this data pack, but not encodable
execute store result score @s ld_result if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:4b,tag:{LockdownData:{channel:0}}}]} run tellraw @a[distance=..5] {"translate":"lockdown.messages.encoder.error.not_encodable","color":"red"}
