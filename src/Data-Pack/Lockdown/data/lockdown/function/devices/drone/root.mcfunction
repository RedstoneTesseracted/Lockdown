# The root function run by all drone entities
# This is run BY and AT the root drone entity
#
# Drones may be in the following states:
# * Patrolling:
#   * Drone periodically picks random position within range of home position
#   * Drone navigates towards chosen position
#   * Drone enters "investigating" state if another entity meets the following conditions:
#       * Is within pursuit range
#       * Is within field-of-view OR is moving quickly
#       * Hasn't recently been investigated
#       * Entity has a different channel score (only applies if drone has non-zero channel score)
#   * Done enters either "pursuing" or "attacking" state if attacked
#
# * Investigating:
#   * Drone navigates towards location of interest
#   * Remains in "investigating" state for at least 10 ticks
#   * The drone checks all suspects within visual pursuit range on its way to the target location
#   * Drone shows a scanning animation and faces towards the nearest suspect
#   * An entity is considered a suspect if:
#       * It within pursuit range
#       * It hasn't recently been investigated
#   * Drone enters either "pursuing" or "attacking" state if a suspect is found to be an "enemy"
#   * Drone enters "patrolling" state if no enemy is found near the location of interest
#   * A suspect is considered an enemy if it's a hostile mob
#   * If the drone has a non-zero channel, it also considers targetables (players + entities
#     with the lockdown.behavior.code_hostile tag) with a non-matching channel to be enemies
#   * If a suspect is found NOT to be an enemy, it will be added to the list of approved
#     entities.  This approval expires after a time.
#   * Done enters either "pursuing" or "attacking" state if attacked
#
# * Attacking:
#   * Drone repeatedly fires at target entity
#   * Drone rotates to face entity
#   * Drone tries to strafe around target?
#   * If target goes out of visual firing range, drone enters "pursuing" state
#   * Drone pursues target if it goes out of firing range
#   * If the drone has a non-zero channel score, and the target's channel score suddenly
#     matches the drone's, it returns to the "investigating" state with no target position
#   * If target is killed, drone enters "investigating" state with no target position
#
# * Pursuing:
#   * Drone stops firing at target entity
#   * Drone navigates towards
#   * If target enters visual firing range, drone enters "attacking" state

# Set scores/storage needed by some nested functions below
scoreboard players operation lockdown.channel lockdown.local = @s lockdown.channel

# Increment action timer for actions below
scoreboard players add @s lockdown.time 1

# Execute different behavior depending on drone state
# The "lockdown.drone.skip_state_function" helps prevent multiple of these from being run in a tick whenever
# the drone's state changes
execute if entity @s[tag=lockdown.drone.state.patrolling] run function lockdown:devices/drone/patrolling/root
execute if entity @s[tag=lockdown.drone.state.investigating,tag=!lockdown.drone.skip_state_function] run function lockdown:devices/drone/investigating/root
execute if entity @s[tag=lockdown.drone.state.attacking,tag=!lockdown.drone.skip_state_function] run function lockdown:devices/drone/attacking/root
execute if entity @s[tag=lockdown.drone.state.pursuing,tag=!lockdown.drone.skip_state_function] run function lockdown:devices/drone/pursuing/root
tag @s remove lockdown.drone.skip_state_function

# Update animations
function lockdown:devices/drone/update_float
#execute on vehicle at @s positioned ~ ~0.15 ~ if predicate lockdown:show_drone_particle run particle minecraft:dust{color:[0.0f,0.25f,1.0f],scale:0.5} ^ ^ ^ 0.0 0.0 0.0 1.0 2
execute on vehicle if predicate lockdown:show_drone_particle at @s positioned ~ ~0.32 ~ rotated ~ 0.0 run function lockdown:devices/drone/fly_particles

# Update visual rotation to match the bee
execute on vehicle rotated as @s on passengers run rotate @s[tag=lockdown.block.display] ~ 0.0

# Destroy drone if hitbox is dead
execute unless predicate lockdown:is_riding_live_bee run function lockdown:devices/drone/destroy
