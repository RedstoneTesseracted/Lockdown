# Spawn and configure item
summon item ~ ~ ~ {Tags:["ld_drone_item"],Item:{id:"minecraft:birch_button",Count:1b,tag:{LockdownItem:1b,LockdownData:{id:7,function_model:10007,block_model:10006,item_model:10006,block_id:1,item_id:1,channel:0},CustomModelData:10006,display:{Name:'{"text":"Defense Drone","italic":"false"}'}}}}
data modify entity @e[type=item,limit=1,sort=nearest,tag=ld_drone_item] Item.tag.LockdownData.channel set from entity @s ArmorItems[3].tag.LockdownData.channel

# Set lore of item
execute if score @s ld_channel matches 0 run data modify entity @e[tag=ld_drone_item,limit=1,sort=nearest] Item.tag.display.Lore set value ['{"text":"No Code Assigned","color":"red"}','{"text":"Attacks Hostile Mobs","color":"green"}']
execute if score @s ld_channel matches 1.. run data modify entity @e[tag=ld_drone_item,limit=1,sort=nearest] Item.tag.display.Lore set value ['{"text":"Code Assigned","color":"green","italic":"false"}','{"text":"Attacks Hostile Mobs","color":"green","italic":"false"}','{"text":"Attacks Unauthorized Players","color":"red","italic":"false"}']

# Summon upgrades if applicable
execute if entity @s[tag=ld_tower_controlled] run summon item ~ ~ ~ {Item:{id:"minecraft:book",Count:1b,tag:{LockdownItem:1b,LockdownData:{upgrade:1b,upgrade_id:1},CustomModelData:9999,display:{Name:'{"text":"Drone Control Tower Upgrade","italic":"false"}',Lore:['{"text":"Allows a drone to receive","color":"light_purple","italic":"false"}','{"text":"commands from a control tower","color":"light_purple","italic":"false"}']}}}}
execute if entity @s[tag=ld_durable] run summon item ~ ~ ~ {Item:{id:"minecraft:book",Count:1b,tag:{LockdownItem:1b,LockdownData:{upgrade:1b,upgrade_id:2},CustomModelData:9998,display:{Name:'{"text":"Durability Upgrade","italic":"false"}',Lore:['{"text":"Increases the durability","color":"light_purple","italic":"false"}','{"text":"of a drone or turret","color":"light_purple","italic":"false"}']}}}}
execute if entity @s[tag=ld_flamethrower] run summon item ~ ~ ~ {Item:{id:"minecraft:book",Count:1b,tag:{LockdownItem:1b,LockdownData:{upgrade:1b,upgrade_id:3},CustomModelData:9997,display:{Name:'{"text":"Flamethrower Upgrade","italic":"false"}',Lore:['{"text":"Drone/Turret laser","color":"light_purple","italic":"false"}','{"text":"sets targets on fire","color":"light_purple","italic":"false"}']}}}}

# Clean up drone
kill @s[type=armor_stand,tag=ld_drone]

# Clean up any bees that should not still exist
execute as @e[type=bee,tag=ld_drone_hitbox] at @s unless entity @e[type=minecraft:armor_stand,tag=ld_drone,distance=..1] run kill @s
