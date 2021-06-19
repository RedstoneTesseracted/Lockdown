# Custom block placing-related commands
function lockdown:reset_item_data
execute as @a[nbt={SelectedItem:{tag:{LockdownItem:1b}}}] run function lockdown:get_item_data
execute as @a[scores={ld_place_button=1..}] run function lockdown:place_block/birch_button_root
execute as @a[scores={ld_place_block=1..}] run function lockdown:place_block/gray_terracotta_root

# Machine behavior-related commands
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_big_button] at @s positioned ~ ~0.23 ~ run function lockdown:devices/button/big_button
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_alarm] at @s positioned ~ ~0.23 ~ run function lockdown:devices/alarm/alarm
execute as @e[type=armor_stand,tag=ld_glow_effect] at @s run function lockdown:devices/alarm/alarm_shine_do
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_heavy_lever] at @s positioned ~ ~0.23 ~ run function lockdown:devices/lever/heavy_lever
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_keypad] at @s positioned ~ ~0.23 ~ run function lockdown:devices/keypad/keypad
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_keycard_reader] at @s positioned ~ ~0.23 ~ run function lockdown:devices/keycard/keycard_reader
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_player_detector] at @s positioned ~ ~0.23 ~ run function lockdown:devices/player_detector/player_detector
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_mob_detector] at @s positioned ~ ~0.23 ~ run function lockdown:devices/mob_detector/mob_detector
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_klaxon] at @s positioned ~ ~0.23 ~ run function lockdown:devices/klaxon/klaxon
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_laser] at @s positioned ~ ~0.23 ~ run function lockdown:devices/laser/laser
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_transmitter] at @s positioned ~ ~0.23 ~ run function lockdown:devices/transmitter/transmitter
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_receiver] at @s positioned ~ ~0.23 ~ run function lockdown:devices/receiver/receiver
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_force_field] at @s positioned ~ ~0.23 ~ run function lockdown:devices/force_field/force_field
execute as @e[type=minecraft:armor_stand,tag=ld_drone] at @s positioned ~ ~ ~ run function lockdown:devices/drone/drone
execute as @e[type=minecraft:armor_stand,tag=ld_turret] at @s positioned ~ ~0.23 ~ run function lockdown:devices/turret/turret
execute as @e[type=minecraft:armor_stand,tag=ld_encoder] at @s positioned ~ ~0.23 ~ run function lockdown:devices/encoder/encoder
execute as @e[type=minecraft:armor_stand,tag=ld_crafter] at @s positioned ~ ~0.23 ~ run function lockdown:devices/crafter/crafter

# Run recipe-book-related commands if player is holding recipe book
execute at @a[nbt={SelectedItem:{id:"minecraft:book",tag:{LockdownRecipeBook:1b}}}] run function lockdown:recipe_book
# Remove right-click detecting armor stands if the closest player within two blocks is not holding the recipe book
execute as @e[type=minecraft:armor_stand,tag=ld_click_detector] at @s unless entity @p[distance=..2,nbt={SelectedItem:{id:"minecraft:book",tag:{LockdownRecipeBook:1b}}}] run kill @s

# Maintain custom block light level and invisibility
execute as @e[type=minecraft:armor_stand,tag=ld_block] run data modify entity @s Fire set value 1000000
effect give @e[tag=ld_invisible] minecraft:invisibility 1000000 1 true

# Replace spawn eggs with correct items after being crafted in a crafting table
execute as @a[scores={ld_craft_crafter=1..}] if data entity @s Inventory[{id:"minecraft:polar_bear_spawn_egg"}].Slot run function lockdown:craft/secure_crafter
execute as @a[scores={ld_craft_book=1..}] if data entity @s Inventory[{id:"minecraft:pufferfish_spawn_egg"}].Slot run function lockdown:craft/secure_book

# Reset some scores
execute at @a[scores={ld_use_noteblock=1..}] as @e[type=minecraft:armor_stand,tag=ld_force_field,limit=1,sort=nearest,distance=..5] at @s positioned ~ ~0.23 ~ run function lockdown:devices/force_field/outline
scoreboard players set @a ld_use_noteblock 0
