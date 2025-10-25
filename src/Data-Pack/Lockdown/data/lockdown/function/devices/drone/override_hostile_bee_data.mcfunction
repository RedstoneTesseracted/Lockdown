# Called by several root state functions to override the hitbox bee's NBT data and keep it "beehaving"

# Check for wrong target
execute store result score lockdown.uuid1 lockdown.local run data get entity @s AngryAt[0]
execute store result score lockdown.uuid2 lockdown.local run data get entity @s data.angry_at[0]
execute unless score lockdown.uuid1 lockdown.local = lockdown.uuid2 lockdown.local run function lockdown:devices/drone/rectify_target

# Force stung status
data modify entity @s HasStung set value 0b
data modify entity @s AngerTime set value 1000

# Force target UUID
#tellraw @a [{text: "[1] AngryAt: "}, {nbt: "AngryAt", entity: "@s"}, {text: ", data.angry_at: "}, {nbt: "data.angry_at", entity: "@s"}]
data remove entity @s AngryAt
data modify entity @s AngryAt set from entity @s data.angry_at
#tellraw @a [{text: "[2] AngryAt: "}, {nbt: "AngryAt", entity: "@s"}, {text: ", data.angry_at: "}, {nbt: "data.angry_at", entity: "@s"}]

# Unfreeze if needed
execute if entity @s[tag=lockdown.drone.motionless] run function lockdown:devices/drone/unfreeze_bee
