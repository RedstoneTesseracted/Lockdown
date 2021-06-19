# Spawn and configure item
summon item ~ ~ ~ {Tags:["ld_turret_item"],Item:{id:"minecraft:birch_button",Count:1b,tag:{LockdownItem:1b,LockdownData:{id:15,function_model:10009,block_model:10008,item_model:10009,block_id:1,item_id:1,channel:0},CustomModelData:10009,display:{Name:'{"text":"Laser Turret","italic":"false"}'}}}}
data modify entity @e[type=item,limit=1,sort=nearest,tag=ld_turret_item] Item.tag.LockdownData.channel set from entity @s ArmorItems[3].tag.LockdownData.channel

# Set lore of item
execute if score @s ld_channel matches 0 run data modify entity @e[tag=ld_turret_item,limit=1,sort=nearest] Item.tag.display.Lore set value ['{"text":"No Code Assigned","color":"red"}','{"text":"Attacks Hostile Mobs","color":"green"}']
execute if score @s ld_channel matches 1.. run data modify entity @e[tag=ld_turret_item,limit=1,sort=nearest] Item.tag.display.Lore set value ['{"text":"Code Assigned","color":"green","italic":"false"}','{"text":"Attacks Hostile Mobs","color":"green","italic":"false"}','{"text":"Attacks Unauthorized Players","color":"red","italic":"false"}']

# Clean up turret
kill @e[type=armor_stand,limit=1,sort=nearest,distance=..0.5,tag=ld_turret_blaster]
kill @s[type=armor_stand,tag=ld_turret]

# Clean up any bees that should not still exist
execute as @e[type=bee,tag=ld_turret_hitbox] at @s unless entity @e[type=minecraft:armor_stand,tag=ld_turret,distance=..0.5] run kill @s

# Do effects
playsound minecraft:block.metal.break block @a ~ ~ ~ 1 1
particle minecraft:block iron_block ~ ~ ~ 0.3 0.3 0.3 1 10
