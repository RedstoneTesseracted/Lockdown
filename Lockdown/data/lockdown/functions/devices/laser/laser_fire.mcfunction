# This function fires the laser from the laser projector
execute if entity @s[scores={ld_facing=1}] run particle dust 1 0 0 1 ~ ~0.5 ~-2 0 0 0.75 1 2
execute if entity @s[scores={ld_facing=2}] run particle dust 1 0 0 1 ~2 ~0.5 ~ 0.75 0 0 1 2
execute if entity @s[scores={ld_facing=3}] run particle dust 1 0 0 1 ~ ~0.5 ~2 0 0 0.75 1 2
execute if entity @s[scores={ld_facing=4}] run particle dust 1 0 0 1 ~-2 ~0.5 ~ 0.75 0 0 1 2

# Apply instant damage to living mobs
execute if entity @s[scores={ld_facing=1}] positioned ~-0.5 ~ ~-3 run effect give @e[dz=3,dx=0,type=!#lockdown:undead] minecraft:instant_damage 1 0 true
execute if entity @s[scores={ld_facing=2}] positioned ~ ~ ~-0.5 run effect give @e[dx=3,dz=0,type=!#lockdown:undead] minecraft:instant_damage 1 0 true
execute if entity @s[scores={ld_facing=3}] positioned ~-0.5 ~ ~ run effect give @e[dz=3,dx=0,type=!#lockdown:undead] minecraft:instant_damage 1 0 true
execute if entity @s[scores={ld_facing=4}] positioned ~-3 ~ ~-0.5 run effect give @e[dx=3,dz=0,type=!#lockdown:undead] minecraft:instant_damage 1 0 true

# Apply instant damage to undead mobs
execute if entity @s[scores={ld_facing=1}] positioned ~-0.5 ~ ~-3 run effect give @e[dz=3,dx=0,type=#lockdown:undead] minecraft:instant_health 1 0 true
execute if entity @s[scores={ld_facing=2}] positioned ~ ~ ~-0.5 run effect give @e[dx=3,dz=0,type=#lockdown:undead] minecraft:instant_health 1 0 true
execute if entity @s[scores={ld_facing=3}] positioned ~-0.5 ~ ~ run effect give @e[dz=3,dx=0,type=#lockdown:undead] minecraft:instant_health 1 0 true
execute if entity @s[scores={ld_facing=4}] positioned ~-3 ~ ~-0.5 run effect give @e[dx=3,dz=0,type=#lockdown:undead] minecraft:instant_health 1 0 true

# Do particle effect
playsound minecraft:block.smoker.smoke block @a ~ ~ ~ 0.75 2
