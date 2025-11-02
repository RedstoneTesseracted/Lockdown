# This function is used to prevent block duplication if a Lockdown device is destroyed via a piston

execute if block ~ ~ ~ minecraft:moving_piston[facing=north] if block ~ ~ ~-1 minecraft:moving_piston run setblock ~ ~ ~-1 minecraft:air
execute if block ~ ~ ~ minecraft:moving_piston[facing=south] if block ~ ~ ~1 minecraft:moving_piston run setblock ~ ~ ~1 minecraft:air
execute if block ~ ~ ~ minecraft:moving_piston[facing=east] if block ~1 ~ ~ minecraft:moving_piston run setblock ~1 ~ ~ minecraft:air
execute if block ~ ~ ~ minecraft:moving_piston[facing=west] if block ~-1 ~ ~ minecraft:moving_piston run setblock ~-1 ~ ~ minecraft:air
execute if block ~ ~ ~ minecraft:moving_piston[facing=up] if block ~ ~1 ~ minecraft:moving_piston run setblock ~ ~1 ~ minecraft:air
execute if block ~ ~ ~ minecraft:moving_piston[facing=down] if block ~ ~-1 ~ minecraft:moving_piston run setblock ~ ~-1 ~ minecraft:air

