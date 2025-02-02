# Function macro containing distance-dependent stuff for the laser projector

# Particle effect at end of beam
$execute positioned ^ ^ ^0.5 run particle minecraft:dust{color:[1.0f,0.0f,0.0f],scale:1.0f} ^ ^ ^$(range) 0.01 0.01 0.01 1.0 1

# Entities caught in beam
$execute positioned ~-0.5 ~-0.5 ~-0.5 as @e[type=!#lockdown:laser_ignore,dx=$(dx),dy=$(dy),dz=$(dz)] run damage @s $(damage) lockdown:projector_laser