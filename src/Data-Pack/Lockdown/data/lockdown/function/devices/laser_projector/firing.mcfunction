# This function handles the laser beam logic
# Each tick, it first updates the laser beam line of sight.
# Then, it expands/shrinks the laser beam range to match.
#
# Entities that cross the laser bream are damaged

# Update line of sight
execute store result score @s lockdown.range run function lockdown:devices/laser_projector/scan_range
scoreboard players operation lockdown.range lockdown.local = @s lockdown.range

# Update beam model
execute on passengers if entity @s[tag=lockdown.laser_projector.beam] store result entity @s transformation.scale[2] float 1.0 run scoreboard players get lockdown.range lockdown.local

# Run function macro for all the distance-dependent stuff
data modify storage lockdown:temp args set value {range: 0, dx: 0.0, dy: 0.0, dz: 0.0, damage: 1}
execute if entity @s[tag=lockdown.direction.up] store result storage lockdown:temp args.dy float -1 run scoreboard players get lockdown.range lockdown.local
execute if entity @s[tag=lockdown.direction.down] store result storage lockdown:temp args.dy float 1 run scoreboard players get lockdown.range lockdown.local
execute if entity @s[tag=lockdown.direction.north] store result storage lockdown:temp args.dz float -1 run scoreboard players get lockdown.range lockdown.local
execute if entity @s[tag=lockdown.direction.south] store result storage lockdown:temp args.dz float 1 run scoreboard players get lockdown.range lockdown.local
execute if entity @s[tag=lockdown.direction.east] store result storage lockdown:temp args.dx float 1 run scoreboard players get lockdown.range lockdown.local
execute if entity @s[tag=lockdown.direction.west] store result storage lockdown:temp args.dx float -1 run scoreboard players get lockdown.range lockdown.local
execute store result storage lockdown:temp args.range int 1 run scoreboard players get lockdown.range lockdown.local
function lockdown:devices/laser_projector/__firing with storage lockdown:temp args
