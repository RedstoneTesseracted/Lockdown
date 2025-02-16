# This function runs additional logic when the drone is chasing down a target

# Force bee data
execute on vehicle run function lockdown:devices/drone/override_hostile_bee_data

# Return to standby state if there's no target
execute unless predicate lockdown:vehicle_target_exists run return run function lockdown:devices/drone/state/standby

# If the drone has reaching the target, switch to the "firing" state
# If the target is out of range, switch back to the "approaching" state
execute if entity @s[tag=lockdown.drone.state.approaching] if predicate lockdown:vehicle_near_target run function lockdown:devices/drone/state/firing
execute if entity @s[tag=lockdown.drone.state.firing] unless predicate lockdown:vehicle_near_target run function lockdown:devices/drone/state/approaching

# Every 30 ticks, fire at the target
scoreboard players operation lockdown.check lockdown.local = @s lockdown.time
scoreboard players operation lockdown.check lockdown.local %= lockdown.drone_fire_interval lockdown.constant
execute if score lockdown.check lockdown.local matches 0 if entity @s[tag=lockdown.drone.state.firing] run function lockdown:devices/drone/fire

