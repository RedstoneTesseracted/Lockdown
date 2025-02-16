# Function macro that displays a sculk vibration particle effect
# starting at the current execution position and going towards the
# position provided via function macro

$particle minecraft:vibration{arrival_in_ticks:5,destination:[$(x), $(y), $(z)]} ~ ~ ~ 0.1 0.1 0.1 1.0 1
