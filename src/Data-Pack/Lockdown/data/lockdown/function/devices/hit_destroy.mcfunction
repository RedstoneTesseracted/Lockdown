# This function handles the destruction of custom block entities.
# It is called from ./hit_destroy_callback, and is run BY and AT affected hitboxes

# Determine the destruction source
tag @a[tag=lockdown.destroy.source] remove lockdown.destroy.source
execute on attacker run tag @s add lockdown.destroy.source

# Destroy the custom block
execute if entity @s[tag=lockdown.block.root] run function lockdown:devices/universal_destroy
execute unless entity @s[tag=lockdown.block.root] on vehicle if entity @s[tag=lockdown.block.root] run function lockdown:devices/universal_destroy

# Clear source status
tag @a[tag=lockdown.destroy.source] remove lockdown.destroy.source
