# Used to override hitbox bee's NBT data and keep it "beehaving"

# Force stung status
data modify entity @s HasStung set value 0b
data modify entity @s anger_end_tine set value 2147483647

# Force target UUID
data modify entity @s angry_at set from entity @s data.angry_at
#tellraw @a [{text: "Target: "}, {nbt: "data.angry_at", entity: "@s"}, {text: ", Actual: "}, {nbt: "AngryAt", entity: "@s"}]

# Bee should not be moving by its own volition while in the attacking state
execute if entity @s[tag=!lockdown.drone.motionless] run function lockdown:devices/drone/freeze_bee

# Face target
execute on target run tag @s add lockdown.drone.target
execute facing entity @n[tag=lockdown.drone.target] eyes run rotate @s ~ ~
execute on target run tag @s remove lockdown.drone.target
