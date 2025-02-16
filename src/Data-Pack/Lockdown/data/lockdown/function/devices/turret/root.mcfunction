# The root turret entity function

# Increment action timer for actions below
scoreboard players add @s lockdown.time 1


# Every 20 ticks, pick a new target
scoreboard players operation lockdown.check lockdown.local = @s lockdown.time
scoreboard players operation lockdown.check lockdown.local %= lockdown.turret_target_interval lockdown.constant
execute if score lockdown.check lockdown.local matches 0 run function lockdown:devices/turret/pick_target


# Every 5 ticks, update the visual facing direction
scoreboard players operation lockdown.check lockdown.local = @s lockdown.time
scoreboard players operation lockdown.check lockdown.local %= lockdown.turret_rotate_interval lockdown.constant
execute if entity @s[tag=lockdown.turret.has_target] if score lockdown.check lockdown.local matches 0 run function lockdown:devices/turret/point_at_target


# Every 30 ticks, fire at the turret
scoreboard players operation lockdown.check lockdown.local = @s lockdown.time
scoreboard players operation lockdown.check lockdown.local %= lockdown.turret_fire_interval lockdown.constant
execute if entity @s[tag=lockdown.turret.has_target] if score lockdown.check lockdown.local matches 0 run function lockdown:devices/turret/fire
tag @e[tag=lockdown.turret.target] remove lockdown.turret.target


# Destroy the turret if applicable
# execute if block ~ ~-1 ~ #lockdown:passthrough run kill @e[distance=..0.5,type=minecraft:bee,tag=ld_turret_hitbox]
execute unless predicate lockdown:has_bee_passenger run function lockdown:devices/turret/destroy
