# Stores the chosen target's UUID in the bee and in scoreboards
# Run BY the drone's hitbox bee

execute on vehicle run data modify entity @s[type=minecraft:bee] AngryAt set from storage lockdown:temp chosen_uuid
execute on vehicle run data modify entity @s[type=minecraft:bee] data.anger_at set from storage lockdown:temp chosen_uuid
data remove storage lockdown:temp chosen_uuid
