# Function macro called by lockdown:items/upgrade/apply/durability
# Run by block hitbox entity
attribute @s minecraft:max_health modifier remove lockdown:durability_bonus
$attribute @s minecraft:max_health modifier add lockdown:durability_bonus $(health) add_value
effect give @s minecraft:instant_health 1 2 true

return 1
