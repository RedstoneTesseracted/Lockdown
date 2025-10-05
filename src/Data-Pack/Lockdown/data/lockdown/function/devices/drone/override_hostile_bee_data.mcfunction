# Called by lockdown:devices/drone/hostile to override the hitbox bee's NBT data and keep it "behaving"

# Force stung status
data modify entity @s HasStung set value 0b
data modify entity @s AngerTime set value 1000

# Force target UUID
data modify storage lockdown:temp UUID set value [I; 0, 0, 0, 0]
execute store result storage lockdown:temp UUID[0] int 1 run scoreboard players get @s lockdown.target_uuid1
execute store result storage lockdown:temp UUID[1] int 1 run scoreboard players get @s lockdown.target_uuid2
execute store result storage lockdown:temp UUID[2] int 1 run scoreboard players get @s lockdown.target_uuid3
execute store result storage lockdown:temp UUID[3] int 1 run scoreboard players get @s lockdown.target_uuid4
data modify entity @s AngryAt set from storage lockdown:temp UUID
data remove storage lockdown:temp UUID

# Unfreeze if needed
execute if entity @s[tag=lockdown.drone.motionless] run function lockdown:devices/drone/unfreeze_bee
