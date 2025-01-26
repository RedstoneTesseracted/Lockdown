# Remove the glow effect if there is no corresponding alarm
execute unless entity @e[type=minecraft:armor_stand,tag=ld_alarm,tag=ld_block,tag=ld_receiving,distance=..0.1] run kill @s[tag=ld_glow_effect]

# Rotate the glow effect
scoreboard players add @s ld_rotation 15
execute if score @s ld_rotation matches 360.. run scoreboard players remove @s ld_rotation 360
execute if score @s ld_rotation matches 0 run scoreboard players set @s ld_rotation 1
execute if entity @s[scores={ld_rotate_about=1}] store result entity @s Pose.Head[1] float 1.0 run scoreboard players get @s ld_rotation
execute if entity @s[scores={ld_rotate_about=2}] store result entity @s Pose.Head[1] float 1.0 run scoreboard players get @s ld_rotation
execute if entity @s[scores={ld_rotate_about=3}] store result entity @s Pose.Head[2] float 1.0 run scoreboard players get @s ld_rotation
