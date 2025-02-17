# Common projectile destruction function for when the projectile hits a surface
# Run BY and AT the root projectile entity

# Play effects
particle minecraft:dust_plume ~ ~ ~ 0.25 0.05 0.25 0.01 20
playsound minecraft:block.stone.break neutral @a ~ ~ ~ 0.5 1.0

# Destroy projectile entities
function lockdown:projectile/common/destroy

