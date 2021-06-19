# Scoreboard objective setup
scoreboard objectives add ld_place_button minecraft.used:minecraft.birch_button
scoreboard objectives add ld_place_block minecraft.used:minecraft.gray_glazed_terracotta
scoreboard objectives add ld_use_noteblock minecraft.custom:minecraft.tune_noteblock
scoreboard objectives add ld_craft_crafter minecraft.crafted:minecraft.polar_bear_spawn_egg
scoreboard objectives add ld_craft_book minecraft.crafted:minecraft.pufferfish_spawn_egg
scoreboard objectives add ld_id dummy
scoreboard objectives add ld_block_model dummy
scoreboard objectives add ld_item_model dummy
scoreboard objectives add ld_block_id dummy
scoreboard objectives add ld_item_id dummy
scoreboard objectives add ld_fun_model dummy
scoreboard objectives add ld_raycast_tries dummy
scoreboard objectives add ld_rotation dummy
scoreboard objectives add ld_rotate_about dummy
scoreboard objectives add ld_channel dummy
scoreboard objectives add ld_channel_id dummy
scoreboard objectives add ld_time dummy
scoreboard objectives add ld_facing dummy
scoreboard objectives add ld_result dummy
scoreboard objectives add ld_success dummy
scoreboard objectives add ld_mode dummy
scoreboard objectives add ld_last_channel dummy
scoreboard objectives add ld_version dummy
scoreboard objectives add ld_uuid1 dummy
scoreboard objectives add ld_target_uuid1 dummy

# Storage container setup
data merge storage lockdown:temp {Items:[]}

# Gamerule setup
gamerule commandBlockOutput false

# Declare data pack version
execute unless score $ld_version ld_version matches -2147483648.. run scoreboard players set $ld_version ld_version 1
