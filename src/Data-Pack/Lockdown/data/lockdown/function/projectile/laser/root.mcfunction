# Root function that custom projectile entities run every tick

# Update motion of mount
execute on vehicle run function lockdown:projectile/common/update_base_motion

# Destroy entity if timer has expired
# execute unless score @s lockdown.time matches 1.. run say timer expired
execute unless score @s lockdown.time matches 1.. run function lockdown:projectile/common/destroy

# Destroy entity if impacting surface
# execute if function lockdown:projectile/laser/is_surface_blocked run say collided with surface
execute if function lockdown:projectile/laser/is_surface_blocked on vehicle at @s run function lockdown:projectile/common/surface_impact

# Collision with entity
# execute if function lockdown:projectile/laser/is_entity_colliding run say colliding
execute if function lockdown:projectile/laser/is_entity_colliding run function lockdown:projectile/laser/impact
