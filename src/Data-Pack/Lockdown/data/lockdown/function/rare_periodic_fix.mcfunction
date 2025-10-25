# Similar to lockdown:periodic_fix, but for lower-priority problems that need to be checked less-frequently

# Clean expired entities from drone's approval lists
execute as @e[tag=lockdown.block.root,tag=lockdown.drone] at @s run function lockdown:devices/drone/approval/clean

# Maintain invisible bees
effect give @e[type=minecraft:bee,tag=lockdown.block.hitbox] minecraft:invisibility infinite 1 true
effect give @e[type=minecraft:bee,tag=lockdown.behavior.regenerates] minecraft:regeneration infinite 0 true
execute as @e[type=minecraft:bee,tag=lockdown.block.hitbox] run data modify entity @s CannotEnterHiveTicks set value 2147483647
execute as @e[type=minecraft:bee,tag=lockdown.block.hitbox] run data modify entity @s TicksSincePollination set value 2147483647

# Schedule this function to run again
schedule function lockdown:rare_periodic_fix 0.5d replace
