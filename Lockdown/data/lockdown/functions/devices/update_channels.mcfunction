# This is a generic function that will update the wireless channels.  This function is not intended to be run continuously.

# Turn off all channels within fifty blocks of any custom block
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=!ld_sending] at @s at @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_receiver,distance=..50] if score @s ld_channel = @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_receiver,limit=1,sort=nearest] ld_channel run tag @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_receiver,limit=1,sort=nearest] remove ld_receiving
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=!ld_sending] at @s at @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_alarm,distance=..50] if score @s ld_channel = @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_alarm,limit=1,sort=nearest] ld_channel run tag @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_alarm,limit=1,sort=nearest] remove ld_receiving

# Have any active signal source turn on their corresponding channel
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_sending] at @s at @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_receiver,distance=..50] if score @s ld_channel = @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_receiver,limit=1,sort=nearest] ld_channel run tag @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_receiver,limit=1,sort=nearest] add ld_receiving
execute as @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_sending] at @s at @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_alarm,distance=..50] if score @s ld_channel = @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_alarm,limit=1,sort=nearest] ld_channel run tag @e[type=minecraft:armor_stand,tag=ld_block,tag=ld_alarm,limit=1,sort=nearest] add ld_receiving
