# This removes potential drone targets if they are not in range of an applicable control tower.  This is run AT the potential target

# Temporarily transfer the channel score to the entity
execute store result score @e[limit=1,sort=nearest,tag=ld_drone_potential_target] ld_temp_channel run scoreboard players get @s ld_channel

# Check if a control tower is within 30 blocks of the entity.  The control tower must have a matching channel
scoreboard players set @e[limit=1,sort=nearest,tag=ld_drone_potential_target] ld_result 0
execute as @e[limit=1,sort=nearest,tag=ld_drone_potential_target] at @e[tag=ld_control_tower,distance=..30] if score @s ld_temp_channel = @e[limit=1,sort=nearest,tag=ld_control_tower] ld_channel run scoreboard players add @s ld_result 1
#tellraw @a {"score":{"objective":"ld_result","name":"@e[limit=1,sort=nearest,tag=ld_drone_potential_target]"}}

# Remove target status if no valid control tower was found
execute as @e[limit=1,sort=nearest,tag=ld_drone_potential_target] if score @s ld_result matches 0 run tag @s remove ld_drone_potential_target

# Reset the temp channel score
scoreboard players reset @e[limit=1,sort=nearest,scores={ld_temp_channel=0..}] ld_temp_channel
