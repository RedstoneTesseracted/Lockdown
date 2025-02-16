# Root function that custom projectile entities run every tick

# Destroy entity if timer has expired
# execute unless score @s lockdown.time matches 1.. run say timer expired
execute unless score @s lockdown.time matches 1.. run function lockdown:projectile/common_destroy

# Destroy entity if no longer mounted to snowball
# execute unless predicate lockdown:is_riding_snowball run say no longer riding snowball
execute unless predicate lockdown:is_riding_snowball run function lockdown:projectile/laser/impact
