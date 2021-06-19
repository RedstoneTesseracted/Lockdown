# Apply special-case drone setup
setblock ~ ~ ~ air
tag @s remove ld_new_hitbox

# A E S T H E T I C
execute facing entity @p eyes run tp @s ~ ~0.5 ~ ~ 0
tp @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=ld_new_block,tag=ld_drone] @s
playsound minecraft:drone_target block @a ~ ~ ~ 1.0 1.0
