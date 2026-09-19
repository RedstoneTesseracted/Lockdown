# This drops the materials used to craft a control tower at the current position.
# Control towers are deprecated, so this function isn't actually used anywhere.
#
# This may be run by either a device root entity or a placer entity.

# This only requires a loot table
execute align xyz run loot spawn ~0.5 ~0.5 ~0.5 loot lockdown:mob_drops/fragile_drone
