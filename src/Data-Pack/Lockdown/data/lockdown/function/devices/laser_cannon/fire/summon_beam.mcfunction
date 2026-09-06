# This function summons the beam fired by the cannon.
# This is run BY and AT the root cannon entity.
#
# The beam initially starts at a size of zero, but is interpolated to larger sizes on subsequent ticks.

# Summon and mount the beam item display
summon minecraft:item_display ~ ~ ~ {teleport_duration: 2, interpolation_duration: 2, brightness: {block: 15, sky: 15}, Tags: ["lockdown.laser_cannon", "lockdown.laser_cannon.beam", "lockdown.laser_cannon.beam.new"], item: {id: "minecraft:paper", count: 1b, components: {"minecraft:item_model": "lockdown:laser_beam", "minecraft:custom_model_data": {colors: [[1.0, 0.0, 0.0]]}}}, transformation: {translation: [0.0f, 1.5625f, 1.25f], left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [0.0f, 0.0f, 0.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f]}}
ride @n[tag=lockdown.laser_cannon.beam.new] mount @s

# Seat beam color
data modify storage lockdown:temp color set value [0.200, 0.604, 0.988]
execute on passengers if entity @s[tag=lockdown.laser_cannon.gantry] if data entity @s item.components."minecraft:custom_model_data".colors[1] run data modify storage lockdown:temp color set from entity @s item.components."minecraft:custom_model_data".colors[1]
data modify entity @n[tag=lockdown.laser_cannon.beam.new] item.components."minecraft:custom_model_data".colors[0] set from storage lockdown:temp color
data remove storage lockdown:temp color

# Set rotation of beam
scoreboard players operation lockdown.laser_cannon.azimuth lockdown.local = @s lockdown.azimuth
execute on passengers if entity @s[tag=lockdown.laser_cannon.beam] store result entity @s Rotation[0] float 0.01 run scoreboard players get lockdown.laser_cannon.azimuth lockdown.local
data modify storage lockdown:temp rotation set value {axis: [1.0, 0.0, 0.0], angle: 0.0}
execute store result storage lockdown:temp rotation.angle float 0.00017453292519943296 run scoreboard players get @s lockdown.pitch
execute on passengers if entity @s[tag=lockdown.laser_cannon.beam] run data modify entity @s transformation.left_rotation set from storage lockdown:temp rotation

# Cannon charge translates directly into beam power
scoreboard players operation @n[tag=lockdown.laser_cannon.beam.new] lockdown.cannon.charge = @s lockdown.cannon.charge

# Update firing state
scoreboard players set @s lockdown.cannon.fire_state 1

# Clear "near" status
tag @e[tag=lockdown.laser_cannon.beam.new] remove lockdown.laser_cannon.beam.new
