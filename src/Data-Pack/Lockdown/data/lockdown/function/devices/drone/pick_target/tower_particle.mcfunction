# Function macro that displays a sculk vibration particle effect
# starting at the current execution position and going towards the
# position provided via function macro

#$particle minecraft:vibration{arrival_in_ticks:10,destination:{type:"minecraft:block",pos:[$(x), $(y), $(z)]}} ~ ~ ~ 0.1 0.1 0.1 2.0 1
$particle minecraft:trail{duration:10,color:[1.0f,0.2f,0.2f],target:[$(x), $(y), $(z)]} ~ ~1 ~ 0.2 0.2 0.2 2.0 5
