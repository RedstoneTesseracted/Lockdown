# Place a drone at current position
#   * Not solid
#   * Moveable
#   * Very special
#
# Entity Composition:
#   * Bee (hitbox)
#   * Drone item display (root entity) (mounted to bee)
#
##### BEGIN INFO BLOCK #####
# > WARNING: This block is used by generate_templates.py to fill in certain details
# > when automatically generating the device placer unit tests.  Change it with caution!
# Solid: false
# Entity: marker
# Directions 0
# Channels: true
# Colors: false
# Extra Parts: lockdown.block.hitbox
# Placement Rules: nonsolid_entity_placement
###### END INFO BLOCK ######


# Prevent overlap with an existing entity
execute align xyz if entity @e[dx=0.1, dy=0.1, dz=0.1,type=#lockdown:blocks_nonsolid_placement,tag=!lockdown.placer] run return run function lockdown:place_block/reject/generic {msg: "lockdown.placer.reject.not_enough_space", loot: "lockdown:drop/drone"}

# Play effects
playsound minecraft:block.metal.place block @a ~ ~ ~ 1.0 1.0


# Summon hitbox entity
execute align xyz run summon minecraft:bee ~0.5 ~0.5 ~0.5 {NoAI:1b, NoGravity:1b, TicksSincePollination: 2147483647, CannotEnterHiveTicks: 2147483647, PersistenceRequired: 1b, active_effects:[{id:"minecraft:invisibility", duration: 1000000, amplifier: 1, show_particles: 0b}], Tags: ["lockdown.block", "lockdown.drone", "lockdown.block.hitbox", "lockdown.block.hitbox.new"], Silent: 1b}


# Summon and mount root entity
execute align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {teleport_duration: 2, interpolation_duration: 35, transformation: {translation: [0.0f, -0.3f, 0.0f], left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f]}, Tags:["lockdown.block","lockdown.block.root","lockdown.block.root.new","lockdown.block.display","lockdown.block.display.new","lockdown.drone","lockdown.drone.body"],item:{id: "minecraft:paper",count:1b,components:{"minecraft:item_model":"lockdown:drone/normal","minecraft:custom_model_data":{strings:["standby"]}}}}
ride @n[tag=lockdown.block.root.new] mount @n[tag=lockdown.block.hitbox.new]

# Rotate item display to match bee
execute as @n[tag=lockdown.block.hitbox] rotated as @s on passengers run rotate @s[tag=lockdown.block.display] ~ ~


# Assign special behavior tags
tag @n[tag=lockdown.block.hitbox.new] add lockdown.behavior.code_hostile
tag @n[tag=lockdown.block.hitbox.new] add lockdown.behavior.upgradeable
tag @n[tag=lockdown.block.root.new] add lockdown.drone.state.standby

# Set scores
execute store result score @n[tag=lockdown.block.root.new] lockdown.channel run data get entity @s data.lockdown_data.channel
scoreboard players operation @n[tag=lockdown.block.hitbox.new] lockdown.channel = @n[tag=lockdown.block.root.new] lockdown.channel
scoreboard players set @n[tag=lockdown.block.root.new] lockdown.time 0
scoreboard players set @n[tag=lockdown.block.root.new] lockdown.upgrades.durability 0
scoreboard players set @n[tag=lockdown.block.root.new] lockdown.upgrades.range 0
scoreboard players set @n[tag=lockdown.block.root.new] lockdown.drone.float 0
scoreboard players operation @n[tag=lockdown.block.root.new] lockdown.firing_range = lockdown.default_drone_range lockdown.constant
scoreboard players operation @n[tag=lockdown.block.root.new] lockdown.firing_damage = lockdown.default_drone_damage lockdown.constant


