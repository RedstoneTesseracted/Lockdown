# This function is responsible for performing the calculations needed
# to point the turret at a target
#
# Display entities inherently limit how we can compose rotations,
# so we're forced to do the transformations ourselves.
# This requires some black magic fudgery, but here's the gist:
# * The first set of rotations (turret orientation) are applied
#   on the model level.  Unique models have been pre-baked for
#   all six turret orientations.
# * From here, we must determine what left and right rotations
#   are required to point the turret at a target.
# * For this, we start by acquiring the x/y/z deltas between the
#   turret and its target.
# * Next, we transform this from the non-rotated coordinate system
#   to the turret's rotated coordinate system.  Fortunately, this
#   transform only requires the swapping and negating of vector
#   components.  The table for all six turret orientations is
#   provided below.
# * The chosen transform also tells us which axes of rotation must
#   be used when updating the display entities.
# * Next, we use the transformed position to obtain the angles
#   required to point a temporary entity from <0,0,0> to said
#   position.  These angles are the exact values that will be
#   written to the left and right rotations.
# * At this point, we have two rotations-one for each axis of
#   rotation.
#
#
# It is run BY and AT the base turret entity
#
# The target is defined as the entity with the lockdown.turret.target tag

# Mark the target with a tag.  Abort if the target is missing
execute unless function lockdown:devices/turret/set_target_context run return 0

# Global System:
#   Axes: {x, y, z}
#   θ: Y-rotation
#   φ: X-rotation
#
# Local Systems (for every possible turret rotation):
# <orientation>: {basis vectors} | (θ, φ) {basis of vectors of rotation} → (θ, φ) {transformed basis vectors of rotation}
# up    : { x, y, z} | (θ, φ) {y, x} → (θ, φ) { y,  x}
# down  : {-x,-y, z} | (θ, φ) {y, x} → (θ, φ) {-y, -x}
# north : { x,-z, y} | (θ, φ) {y, x} → (θ, φ) {-z,  x}
# south : { x, z,-y} | (θ, φ) {y, x} → (θ, φ) { z,  x}
# west  : { y,-x, z} | (θ, φ) {y, x} → (θ, φ) {-x,  y}
# East  : {-y, x, z} | (θ, φ) {y, x} → (θ, φ) { x, -y}

# Initial storage setup
data modify storage lockdown:temp rotation.transformation set value {left_rotation: {angle: 0.0f, axis: [0.0f, 0.0f, 0.0f]}, right_rotation: {angle: 0.0f, axis: [0.0f, 0.0f, 0.0f]}}

# Acquire the target's position relative to the turret's coordinate system
function lockdown:devices/turret/point_at_target/acquire_target_position

# Determine the angles needed to point at this position
execute summon minecraft:marker run function lockdown:devices/turret/point_at_target/acquire_angles

# Send to display entities
execute on passengers if entity @s[tag=lockdown.turret.gantry] run data modify entity @s transformation.left_rotation set from storage lockdown:temp rotation.transformation.left_rotation
execute on passengers if entity @s[tag=lockdown.turret.barrel] run data modify entity @s transformation merge from storage lockdown:temp rotation.transformation
execute on passengers if entity @s[tag=lockdown.turret.beam] run data modify entity @s transformation merge from storage lockdown:temp rotation.transformation
execute on passengers if entity @s[tag=lockdown.block.display] run data modify entity @s start_interpolation set value 0
