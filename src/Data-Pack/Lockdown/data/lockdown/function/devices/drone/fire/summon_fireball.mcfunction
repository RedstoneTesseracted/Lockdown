# This function configures a fireball spawned by the turret
# This is run BY and AT the fireball, and is invoked using `execute summon minecraft:small_fireball`

# Set NBT data
data modify entity @s Motion[0] set from storage lockdown:temp pos.x
data modify entity @s Motion[1] set from storage lockdown:temp pos.y
data modify entity @s Motion[2] set from storage lockdown:temp pos.z
