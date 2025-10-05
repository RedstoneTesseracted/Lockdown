# This function summons an entity used to direct the drone's patrol route

# Remove any existing patrol points
execute on vehicle on target run kill @s[tag=lockdown.drone.patrol_marker]

# Spawn entity
data modify storage lockdown:temp OwnerUUID set from entity @s UUID
$execute positioned $(x) $(y) $(z) align xyz summon minecraft:armor_stand run function lockdown:devices/drone/patrolling/__create_patrol_point

# Set entity as target
function lockdown:devices/drone/pick_target/store_target_uuid

# Clean up storage
data remove storage lockdown:temp OwnerUUID
data remove storage lockdown:temp chosen_uuid
