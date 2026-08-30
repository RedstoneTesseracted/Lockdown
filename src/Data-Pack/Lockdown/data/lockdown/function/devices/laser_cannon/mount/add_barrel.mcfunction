# This function mounts a barrel onto the cannon base that called it

# Summon and mount new item display
execute align xyz run summon minecraft:item_display ~0.5 ~ ~0.5 {teleport_duration: 2, interpolation_duration: 1, transformation: {translation: [0.0f, 2.0f, 0.0f], left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [4.0f, 4.0f, 4.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f]}, Tags:["lockdown.block","lockdown.block.display","lockdown.block.display.new","lockdown.laser_cannon","lockdown.laser_cannon.barrel"],item:{id: "minecraft:paper",count:1b,components:{"minecraft:item_model":"lockdown:laser_cannon/cannon","minecraft:custom_model_data":{strings:["idle"]}}}}
ride @n[tag=lockdown.block.display.new,tag=lockdown.laser_cannon.barrel] mount @s

# Summon and mount seat interaction
execute align xyz run summon minecraft:interaction ~0.5 ~ ~0.5 {NoGravity:1b, width: 1.0, height: 0.5, Tags: ["lockdown.block", "lockdown.laser_cannon", "lockdown.laser_cannon.seat", "lockdown.block.hitbox", "lockdown.block.hitbox.new", "lockdown.behavior.attack_to_destroy", "lockdown.behavior.rideable"]}
ride @n[tag=lockdown.block.hitbox.new,tag=lockdown.laser_cannon.seat] mount @s

# Manually some functions from the placer logic
function lockdown:place_block/place/common_version
function lockdown:place_block/place/common_new_clear

# Play effects
particle minecraft:cloud ~ ~0.5 ~ 0.5 0.5 0.5 0.1 20
playsound minecraft:block.anvil.use block @a ~ ~ ~ 1.0 1.0

# Destroy mounting interaction
execute on passengers run kill @s[tag=lockdown.laser_cannon.gantry,tag=lockdown.block.hitbox]
execute on passengers on passengers run kill @s[tag=lockdown.laser_cannon.gantry,tag=lockdown.block.hitbox]

# Update state tags
tag @s add lockdown.laser_cannon.has_barrel
