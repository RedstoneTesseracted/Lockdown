# Function used to set up the initial alarm glow left rotation tag—particularly its axis
# This is run BY the root alarm entity

execute if entity @s[tag=lockdown.direction.down] run return run data modify storage lockdown:temp rotation set value {angle: 0.0f, axis: [0.0f, 1.0f, 0.0f]}
execute if entity @s[tag=lockdown.direction.up] run return run data modify storage lockdown:temp rotation set value {angle: 0.0f, axis: [0.0f, -1.0f, 0.0f]}
execute if entity @s[tag=lockdown.direction.north] run return run data modify storage lockdown:temp rotation set value {angle: 0.0f, axis: [0.0f, 0.0f, 1.0f]}
execute if entity @s[tag=lockdown.direction.south] run return run data modify storage lockdown:temp rotation set value {angle: 0.0f, axis: [0.0f, 0.0f, -1.0f]}
execute if entity @s[tag=lockdown.direction.east] run return run data modify storage lockdown:temp rotation set value {angle: 0.0f, axis: [1.0f, 0.0f, 0.0f]}
execute if entity @s[tag=lockdown.direction.west] run return run data modify storage lockdown:temp rotation set value {angle: 0.0f, axis: [-1.0f, 0.0f, 0.0f]}
