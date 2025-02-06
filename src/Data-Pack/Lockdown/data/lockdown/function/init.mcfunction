#### Declare scoreboards

# Utility objectives
scoreboard objectives add lockdown.local dummy
scoreboard objectives add lockdown.time dummy
scoreboard objectives add lockdown.press_time dummy
scoreboard objectives add lockdown.global dummy
scoreboard objectives add lockdown.rotation dummy
scoreboard objectives add lockdown.mode dummy
scoreboard objectives add lockdown.channel.sources dummy
scoreboard objectives add lockdown.range dummy
scoreboard objectives add lockdown.held_channel dummy

scoreboard objectives add lockdown.uuid1 dummy
scoreboard objectives add lockdown.uuid2 dummy
scoreboard objectives add lockdown.uuid3 dummy
scoreboard objectives add lockdown.uuid4 dummy

# Global configuration scores
scoreboard players set lockdown.max_laser_distance lockdown.global 10

# Mechanic objectives
scoreboard objectives add lockdown.channel dummy
scoreboard objectives add lockdown.use_carrot_on_a_stick minecraft.used:minecraft.carrot_on_a_stick


#### Scheduled timers
function lockdown:periodic_fix
function lockdown:periodic_break_check


#### Storage containers
data merge storage lockdown:temp {}



#### Versioning



######################### LEGACY #########################
# Scoreboard objective setup
# scoreboard objectives add ld_id dummy
# scoreboard objectives add ld_block_model dummy
# scoreboard objectives add ld_item_model dummy
# scoreboard objectives add ld_block_id dummy
# scoreboard objectives add ld_item_id dummy
# scoreboard objectives add ld_fun_model dummy
# scoreboard objectives add ld_raycast_tries dummy
# scoreboard objectives add ld_rotation dummy
# scoreboard objectives add ld_rotate_about dummy
# scoreboard objectives add ld_channel dummy
# scoreboard objectives add ld_channel_id dummy
# scoreboard objectives add ld_time dummy
# scoreboard objectives add ld_facing dummy
# scoreboard objectives add ld_result dummy
# scoreboard objectives add ld_success dummy
# scoreboard objectives add ld_mode dummy
# scoreboard objectives add ld_last_channel dummy
# scoreboard objectives add ld_version dummy
# scoreboard objectives add ld_uuid1 dummy
# scoreboard objectives add ld_target_uuid1 dummy

# scoreboard objectives add ld_temp_channel dummy

# Declare data pack version
# execute unless score $ld_version ld_version matches -2147483648.. run scoreboard players set $ld_version ld_version 2

# Upgrade data pack
# Ver 1→2
# execute if score $ld_version ld_version matches 1 run scoreboard players set $ld_version ld_version 2
