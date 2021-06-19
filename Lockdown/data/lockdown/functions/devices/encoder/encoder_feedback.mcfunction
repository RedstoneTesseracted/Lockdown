# This function informs the player why the encoder failed to encode an item
# No item was provided
execute store result score @s ld_result unless block ~ ~ ~ minecraft:dispenser{Items:[{Slot:4b}]} run tellraw @a[distance=..5] {"text":"No item was provided for encoding","color":"red"}

# Item was not from this data pack
execute store result score @s ld_result if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:4b}]} unless block ~ ~ ~ minecraft:dispenser{Items:[{Slot:4b,tag:{LockdownData:{}}}]} run tellraw @a[distance=..5] {"text":"This item is not encodable","color":"red"}

# Item was from this data pack, but not encodable
execute store result score @s ld_result if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:4b,tag:{LockdownData:{channel:-1}}}]} run tellraw @a[distance=..5] {"text":"This item is not encodable","color":"red"}

# Play sound effect
playsound minecraft:block.note_block.didgeridoo block @a ~ ~ ~ 1 0
