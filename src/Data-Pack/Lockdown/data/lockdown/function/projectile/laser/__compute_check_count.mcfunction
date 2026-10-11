# Function called by the pre-26.3 implementation of compute_check_count that uses a display entity transformations to calculate a vector norm

# Set transformation matrix
data modify entity @s transformation set from storage lockdown:temp args

# Multiply result by 1/0.2 and save result to score
execute store result score lockdown.count lockdown.local run data get entity @s transformation.scale[0] 5.0

# Remove temporary entity
kill @s[type=minecraft:block_display]
