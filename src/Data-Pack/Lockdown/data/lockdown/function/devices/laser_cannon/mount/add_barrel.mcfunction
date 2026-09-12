# This function mounts a barrel onto the cannon base that called it

# This *SHOULDN'T* ever run, since barrel_callback should catch attempts to double-mount a barrel.  But... better safe than sorry
execute if entity @s[tag=lockdown.laser_cannon.has_barrel] run return fail

# Summon and mount new item display
execute align xyz run summon minecraft:item_display ~0.5 ~ ~0.5 {teleport_duration: 2, interpolation_duration: 2, transformation: {translation: [0.0f, 1.5625f, 1.25f], left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [4.0f, 4.0f, 4.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f]}, Tags:["lockdown.block","lockdown.block.display","lockdown.block.display.new","lockdown.laser_cannon","lockdown.laser_cannon.barrel"],item:{id: "minecraft:paper",count:1b,components:{"minecraft:item_model":"lockdown:laser_cannon/cannon","minecraft:custom_model_data":{strings:["idle"]}}}}
ride @n[tag=lockdown.block.display.new,tag=lockdown.laser_cannon.barrel] mount @s

# Summon and mount seat interaction
execute align xyz run summon minecraft:interaction ~0.5 ~ ~0.5 {NoGravity:1b, width: 1.0, height: 0.5, Tags: ["lockdown.block", "lockdown.laser_cannon", "lockdown.laser_cannon.seat", "lockdown.block.hitbox", "lockdown.block.hitbox.new", "lockdown.behavior.attack_to_destroy"]}
ride @n[tag=lockdown.block.hitbox.new,tag=lockdown.laser_cannon.seat] mount @s

# Make the base interaction entity larger and clickable
execute on passengers if entity @s[tag=lockdown.laser_cannon.base,tag=lockdown.block.hitbox] run data modify entity @s height set from entity @s width
execute on passengers if entity @s[tag=lockdown.laser_cannon.base,tag=lockdown.block.hitbox] run tag @s add lockdown.behavior.rideable

# Manually run some functions from the placer logic
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
