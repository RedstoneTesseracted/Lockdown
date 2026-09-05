# Place a cannon platform
#   * Not solid
#
# Entity Composition:
#   * Base item display (root entity)
#   * Hitbox (interaction)
#
##### BEGIN INFO BLOCK #####
# > WARNING: This block is used by generate_templates.py to fill in certain details
# > when automatically generating the device placer unit tests.  Change it with caution!
# Solid: false
# Entity: item_frame
# Directions: 0
# Channels: false
# Colors: false
# Extra Parts: lockdown.block.hitbox
# Special: true
# Placement Rules: nonsolid_entity_placement, 3x3_space
# Destruction Rule: interaction_attack
###### END INFO BLOCK ######

# Prevent overlap with an existing block/entity
execute unless predicate lockdown:platform_enough_space run return run function lockdown:place_block/reject/generic {msg: "lockdown.placer.reject.not_enough_space", dropper: "lockdown:drop/cannon_platform"}
execute align xyz positioned ~-1 ~ ~-1 if entity @e[dx=1.1, dy=0.1, dz=1.1,type=#lockdown:blocks_nonsolid_placement,tag=!lockdown.placer] run return run function lockdown:place_block/reject/generic {msg: "lockdown.placer.reject.not_enough_space", dropper: "lockdown:drop/cannon_platform"}

# Clear replaceable blocks
execute if predicate lockdown:platform_enough_space run fill ~-1 ~ ~-1 ~1 ~ ~1 minecraft:air destroy 

# Play effects
playsound minecraft:block.metal.place block @a ~ ~ ~ 1.0 1.0

# Summon root entity
execute align xyz run summon minecraft:item_display ~0.5 ~ ~0.5 {teleport_duration: 2, interpolation_duration: 2, transformation: {translation: [0.0f, 2.0f, 0.0f], left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [4.0f, 4.0f, 4.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f]}, Tags:["lockdown.block","lockdown.block.root","lockdown.block.root.new","lockdown.block.display","lockdown.block.display.new","lockdown.laser_cannon","lockdown.laser_cannon.base"],item:{id: "minecraft:paper",count:1b,components:{"minecraft:item_model":"lockdown:laser_cannon/base","minecraft:custom_model_data":{strings:["idle"]}}}}

# Summon and mount hitbox entity
execute align xyz run summon minecraft:interaction ~0.5 ~ ~0.5 {NoGravity:1b, width: 2.5, height: 0.125, Tags: ["lockdown.block", "lockdown.laser_cannon", "lockdown.laser_cannon.base", "lockdown.block.hitbox", "lockdown.block.hitbox.new", "lockdown.behavior.upgradeable"]}
ride @n[tag=lockdown.block.hitbox.new] mount @n[tag=lockdown.block.root.new]

# Behavior tags
tag @n[tag=lockdown.block.hitbox.new] add lockdown.behavior.attack_to_destroy

# Assign scores
scoreboard players set @n[tag=lockdown.block.root.new] lockdown.azimuth 0
scoreboard players set @n[tag=lockdown.block.root.new] lockdown.pitch 0
scoreboard players set @n[tag=lockdown.block.root.new] lockdown.cannon.charge 0
