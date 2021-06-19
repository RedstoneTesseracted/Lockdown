# Remove the birch button
setblock ~ ~ ~ air

# Turret blaster set up
summon minecraft:armor_stand ~ ~ ~ {Tags:["ld_turret_blaster","ld_new_blaster"],Invulnerable:1b,Small:1b,Marker:1b,NoGravity:1b,Invisible:1b,ArmorItems:[{},{},{},{id:"minecraft:birch_button",Count:1b,tag:{CustomModelData:0}}]}
data modify entity @e[type=minecraft:armor_stand,tag=ld_new_blaster,limit=1,sort=nearest] ArmorItems[3].tag.CustomModelData set from entity @s ArmorItems[3].tag.LockdownData.function_model
tag @e[type=minecraft:armor_stand,tag=ld_new_blaster,limit=1,sort=nearest] remove ld_new_blaster

# Set up the turret hitbox
summon minecraft:bee ~ ~ ~ {Tags:["ld_turret_hitbox","ld_invisible"],NoGravity:1b,NoAI:1b,Silent:1b,DeathTime:15,ActiveEffects:[{Id:14,lvl:1,Duration:1000000,ShowParticles:0b}],Attributes:[{Name:"minecraft:generic.max_health",Base:35.0d}],Health:35}

# Destroy the turret if the block below is air
execute if block ~ ~-1 ~ #lockdown:passthrough run kill @e[type=bee,tag=ld_turret_hitbox,limit=1,sort=nearest]
