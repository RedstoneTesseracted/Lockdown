# This drops and configures a mob detector item at the current position.
#
# This may be run by either a device root entity or a placer entity.

# This only requires a loot table
execute align xyz run loot spawn ~0.5 ~0.5 ~0.5 loot lockdown:item/mob_detector
