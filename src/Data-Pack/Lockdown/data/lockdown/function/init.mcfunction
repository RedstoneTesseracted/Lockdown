#### Declare scoreboards

# Utility objectives
scoreboard objectives add lockdown.local dummy
scoreboard objectives add lockdown.time dummy
scoreboard objectives add lockdown.press_time dummy
scoreboard objectives add lockdown.constant dummy
scoreboard objectives add lockdown.rotation dummy
scoreboard objectives add lockdown.mode dummy
scoreboard objectives add lockdown.channel.sources dummy
scoreboard objectives add lockdown.range dummy
scoreboard objectives add lockdown.held_channel dummy
scoreboard objectives add lockdown.left_origin dummy

scoreboard objectives add lockdown.motion.x dummy
scoreboard objectives add lockdown.motion.y dummy
scoreboard objectives add lockdown.motion.z dummy

scoreboard objectives add lockdown.origin_uuid1 dummy
scoreboard objectives add lockdown.origin_uuid2 dummy
scoreboard objectives add lockdown.origin_uuid3 dummy
scoreboard objectives add lockdown.origin_uuid4 dummy

scoreboard objectives add lockdown.target_uuid1 dummy
scoreboard objectives add lockdown.target_uuid2 dummy
scoreboard objectives add lockdown.target_uuid3 dummy
scoreboard objectives add lockdown.target_uuid4 dummy

scoreboard objectives add lockdown.uuid1 dummy
scoreboard objectives add lockdown.uuid2 dummy
scoreboard objectives add lockdown.uuid3 dummy
scoreboard objectives add lockdown.uuid4 dummy

scoreboard objectives add lockdown.creation_timestamp dummy

scoreboard objectives add lockdown.drone.float.x dummy
scoreboard objectives add lockdown.drone.float.y dummy
scoreboard objectives add lockdown.drone.choose_timestamp dummy
scoreboard objectives add lockdown.drone.reach_timestamp dummy
scoreboard objectives add lockdown.drone.target_priority dummy
scoreboard objectives add lockdown.home.x dummy
scoreboard objectives add lockdown.home.y dummy
scoreboard objectives add lockdown.home.z dummy

# Global configuration scores
# Turret
scoreboard players set lockdown.turret_target_interval lockdown.constant 20
scoreboard players set lockdown.turret_rotate_interval lockdown.constant 5
scoreboard players set lockdown.turret_fire_interval lockdown.constant 30
scoreboard players set lockdown.default_turret_range lockdown.constant 8
scoreboard players set lockdown.default_turret_damage lockdown.constant 4
# Drone
scoreboard players set lockdown.drone_float_interval lockdown.constant 25
scoreboard players set lockdown.drone_target_interval lockdown.constant 31
scoreboard players set lockdown.drone_suspect_interval lockdown.constant 10
scoreboard players set lockdown.drone_fire_interval lockdown.constant 30
scoreboard players set lockdown.drone_patrol_timeout lockdown.constant 300
scoreboard players set lockdown.drone_patrol_delay lockdown.constant 40
scoreboard players set lockdown.drone_investigate_timeout lockdown.constant 300
scoreboard players set lockdown.drone_investigate_delay lockdown.constant 100
scoreboard players set lockdown.drone_approval_expire lockdown.constant 4800
scoreboard players set lockdown.default_drone_pursuit_enter_range lockdown.constant 14
scoreboard players set lockdown.default_drone_pursuit_exit_range lockdown.constant 16
scoreboard players set lockdown.default_drone_firing_enter_range lockdown.constant 6
scoreboard players set lockdown.default_drone_firing_exit_range lockdown.constant 11
scoreboard players set lockdown.default_drone_damage lockdown.constant 4
# Misc
scoreboard players set lockdown.max_laser_distance lockdown.constant 10
scoreboard players set lockdown.max_durability_upgrades lockdown.constant 3
scoreboard players set lockdown.max_range_upgrades lockdown.constant 3


# Numbers
scoreboard objectives add lockdown.number dummy
scoreboard players set -1 lockdown.number -1
scoreboard players set 2 lockdown.number 2
scoreboard players set 10 lockdown.number 10
scoreboard players set 16 lockdown.number 16

# Mechanic objectives
scoreboard objectives add lockdown.channel dummy
scoreboard objectives add lockdown.pursuit_exit_range dummy
scoreboard objectives add lockdown.pursuit_enter_range dummy
scoreboard objectives add lockdown.firing_range dummy
scoreboard objectives add lockdown.firing_exit_range dummy
scoreboard objectives add lockdown.firing_enter_range dummy
scoreboard objectives add lockdown.firing_damage dummy
scoreboard objectives add lockdown.use_carrot_on_a_stick minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add lockdown.upgrades.range dummy
scoreboard objectives add lockdown.upgrades.durability dummy

#### Scheduled timers
function lockdown:periodic_fix
function lockdown:periodic_break_check
function lockdown:lazy_tick


#### Storage containers
data merge storage lockdown:temp {}



#### Restore entity properties
execute as @e[tag=lockdown.block.display,tag=lockdown.turret,tag=!lockdown.turret.base,tag=!lockdown.turret.beam] store result entity @s interpolation_duration int 1 run scoreboard players get lockdown.turret_rotate_interval lockdown.constant
scoreboard players set @e[tag=lockdown.drone,tag=lockdown.block.display,type=minecraft:item_display] lockdown.drone.float.x 1000
scoreboard players set @e[tag=lockdown.drone,tag=lockdown.block.display,type=minecraft:item_display] lockdown.drone.float.y 0


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
