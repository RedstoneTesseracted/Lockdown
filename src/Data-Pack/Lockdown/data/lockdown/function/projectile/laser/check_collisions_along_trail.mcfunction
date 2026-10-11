# At each game tick, laser projectiles are effectively teleported forward based on their speed.
# This means that they can accidentally teleport past another entity's hitbox at high enough speeds.
#
# This function is intended to solve this by running a dynamic number of checks along the projectile's
# path from the previous tick.  To do this, we use macros to point at the previous tick's position, then
# run a recursive loop that steps forward at 0.2 block increments (since the virtual hitbox is a
# 0.2-block cube).  The loop stops after N+1 iterations, where N is given by:
#
# N = Distance Traveled / 0.2 = sqrt(dx*dx + dy*dy + dz*dz) / 0.2
#
# This is called by lockdown:projectile/laser/is_entity_colliding if another non-ignored entity is nearby.


# First, calculate the number of checks to perform based on the distance traveled.
# The implementation of this changes between versions, so it's been moved to the function lockdown:projectile/laser/compute_check_count
function lockdown:projectile/laser/compute_check_count
scoreboard players add lockdown.count lockdown.local 1

# Cap count to a reasonable value
execute if score lockdown.count lockdown.local matches 40.. run scoreboard players set lockdown.count lockdown.local 40

# Set up arguments to function macro
# These are also re-used by the calculation below for a (probably negligible) performance benefit
data modify storage lockdown:temp args set value {x: 0.0, y: 0.0, z: 0.0}
execute store result storage lockdown:temp args.x float 0.013986013986013986 run scoreboard players get @s lockdown.last_x
execute store result storage lockdown:temp args.y float 0.013986013986013986 run scoreboard players get @s lockdown.last_y
execute store result storage lockdown:temp args.z float 0.013986013986013986 run scoreboard players get @s lockdown.last_z

scoreboard players set lockdown.macro_result lockdown.local 0
execute store result score lockdown.macro_result lockdown.local run function lockdown:projectile/laser/__check_collisions_along_trail with storage lockdown:temp args
execute unless score lockdown.macro_result lockdown.local matches 1 run tellraw @p {translate: "lockdown.messages.bug.macro.generic", color: "red", with: [{text: "lockdown:projectile/laser/__check_collisions_along_trail", color:"gray", underlined: true}]}
