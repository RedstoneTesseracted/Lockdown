# Attempt to encode the item in the encoder

# Assert that an item has been provided
execute unless data block ~ ~ ~ Items[{Slot:4b}] run tellraw @a[distance=..5] {translate:"lockdown.messages.encoder.error.no_item",color:"red"}
execute unless data block ~ ~ ~ Items[{Slot:4b}] run return run playsound minecraft:block.note_block.didgeridoo block @a ~ ~ ~ 1 0

# Assert that item is encodable
execute unless data block ~ ~ ~ Items[{Slot:4b}].components."minecraft:custom_data".lockdown_data{encodable: 1b} run tellraw @a[distance=..5] {translate:"lockdown.messages.encoder.error.not_encodable",color:"red"}
execute unless data block ~ ~ ~ Items[{Slot:4b}].components."minecraft:custom_data".lockdown_data{encodable: 1b} run return run playsound minecraft:block.note_block.didgeridoo block @a ~ ~ ~ 1 0

# Assert that dyes are present in all three slots
execute unless items block ~ ~ ~ container.6 #lockdown:dyes run tellraw @a[distance=..5] {translate:"lockdown.messages.encoder.error.missing_dye",color:"red"}
execute unless items block ~ ~ ~ container.6 #lockdown:dyes run return run playsound minecraft:block.note_block.didgeridoo block @a ~ ~ ~ 1 0

execute unless items block ~ ~ ~ container.7 #lockdown:dyes run tellraw @a[distance=..5] {translate:"lockdown.messages.encoder.error.missing_dye",color:"red"}
execute unless items block ~ ~ ~ container.7 #lockdown:dyes run return run playsound minecraft:block.note_block.didgeridoo block @a ~ ~ ~ 1 0

execute unless items block ~ ~ ~ container.8 #lockdown:dyes run tellraw @a[distance=..5] {translate:"lockdown.messages.encoder.error.missing_dye",color:"red"}
execute unless items block ~ ~ ~ container.8 #lockdown:dyes run return run playsound minecraft:block.note_block.didgeridoo block @a ~ ~ ~ 1 0

# Compute and transfer code to the item's channel tag
execute store result storage lockdown:temp channel int 1.0 run function lockdown:devices/encoder/compute_code
execute store result score lockdown.success lockdown.local run function lockdown:devices/encoder/assign_code
execute if score lockdown.success lockdown.local matches 0 run tellraw @a[distance=..5] {translate:"lockdown.messages.encoder.error.i_forgot_an_item",color:"red"}
execute if score lockdown.success lockdown.local matches 0 run return run playsound minecraft:block.note_block.didgeridoo block @a ~ ~ ~ 1 0

# Identify whether the lore should say "channel" or "code"
scoreboard players set lockdown.result lockdown.local 0
execute store result score lockdown.result lockdown.local run function lockdown:devices/encoder/determine_lore
execute if score lockdown.result lockdown.local matches 0 run item modify block ~ ~ ~ container.4 lockdown:set_channel_lore
execute if score lockdown.result lockdown.local matches 1 run item modify block ~ ~ ~ container.4 lockdown:set_code_lore

# Notify player of success
playsound minecraft:block.note_block.pling block @a ~ ~ ~ 1 2
tellraw @a[distance=..5] {translate:"lockdown.messages.encoder.success",color:"green"}

