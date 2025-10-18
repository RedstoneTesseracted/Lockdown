# Used to override hitbox bee's NBT data and keep it "beehaving"

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

# Bee should not be moving by its own volition while in the attacking state
execute if entity @s[tag=!lockdown.drone.motionless] run function lockdown:devices/drone/freeze_bee

# Face target
execute on target run tag @s add lockdown.drone.target
execute facing entity @n[tag=lockdown.drone.target] eyes run rotate @s ~ ~
execute on target run tag @s remove lockdown.drone.target
