# This function is responsible for performing the calculations needed
# to point the turret at a target
#
# It is run BY and AT the base turret entity
#
# The target is defined as the entity with the lockdown.turret.target tag

# Convert angles to local coordinates
# Global System:
#   Axes: {x, y, z}
#   θ: Y-rotation
#   φ: X-rotation
#
# Local Systems:
# up    : { x, y, z} | (θ, φ) {y, x} → (θ, φ) { y,  x}
# down  : {-x,-y, z} | (θ, φ) {y, x} → (θ, φ) {-y, -x}
# north : { x,-z, y} | (θ, φ) {y, x} → (θ, φ) {-z,  x}
# south : { x, z,-y} | (θ, φ) {y, x} → (θ, φ) { z,  x}
# west  : { y,-x, z} | (θ, φ) {y, x} → (θ, φ) {-x,  y}
# East  : {-y, x, z} | (θ, φ) {y, x} → (θ, φ) { x, -y}

# Initial storage setup
data modify storage lockdown:temp rotation.transformation set value {left_rotation: {angle: 0.0f, axis: [0.0f, 0.0f, 0.0f]}, right_rotation: {angle: 0.0f, axis: [0.0f, 0.0f, 0.0f]}}

# Acquire the target's position relative to the turret's coordinate system
function lockdown:devices/turret/acquire_target_position

# Determine the angles needed to point at this position
execute summon minecraft:marker run function lockdown:devices/turret/acquire_angles

# Send to display entities
execute on passengers if entity @s[tag=lockdown.turret.gantry] run data modify entity @s transformation.left_rotation set from storage lockdown:temp rotation.transformation.left_rotation
execute on passengers if entity @s[tag=lockdown.turret.barrel] run data modify entity @s transformation merge from storage lockdown:temp rotation.transformation
execute on passengers if entity @s[tag=lockdown.block.display] run data modify entity @s start_interpolation set value 0
