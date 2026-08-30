# This drops and configures laser cannon items at the current position.
#
# This may be run by either a device root entity or a placer entity.

# The cannon could consist of multiple loot tables
execute align xyz run loot spawn ~0.5 ~0.5 ~0.5 loot lockdown:item/cannon_platform
execute align xyz if entity @s[tag=lockdown.laser_cannon.has_gantry] run loot spawn ~0.5 ~0.5 ~0.5 loot lockdown:item/cannon_gantry
execute align xyz if entity @s[tag=lockdown.laser_cannon.has_barrel] run loot spawn ~0.5 ~0.5 ~0.5 loot lockdown:item/cannon_barrel
