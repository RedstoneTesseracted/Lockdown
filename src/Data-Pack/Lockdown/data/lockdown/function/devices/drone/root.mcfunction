# The root function run by all drone entities

# Increment action timer for actions below
scoreboard players add @s lockdown.time 1

# Every 31 ticks, pick a new target
scoreboard players operation lockdown.check lockdown.local = @s lockdown.time
scoreboard players operation lockdown.check lockdown.local %= lockdown.drone_target_interval lockdown.constant
execute if score lockdown.check lockdown.local matches 0 run function lockdown:devices/drone/pick_target

# Every 25 ticks, update the visual floating
scoreboard players operation lockdown.check lockdown.local = @s lockdown.time
scoreboard players operation lockdown.check lockdown.local %= lockdown.drone_float_interval lockdown.constant
execute if score lockdown.check lockdown.local matches 0 run function lockdown:devices/drone/update_float

# Update visual rotation to match the bee
execute on vehicle rotated as @s on passengers run rotate @s[tag=lockdown.block.display] ~ 0.0

# Run hostile behavior if applicable
execute if entity @s[tag=lockdown.drone.state.hostile] run function lockdown:devices/drone/hostile

# Destroy drone if hitbox is dead
execute unless predicate lockdown:is_riding_live_bee run function lockdown:devices/drone/destroy
