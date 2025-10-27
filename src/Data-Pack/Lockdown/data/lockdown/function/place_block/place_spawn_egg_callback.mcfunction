# This function runs the lockdown device placer entities whenever the player summons one
# It is called using an advancement trigger, and is therefore run BY and AT the player

# Mark this player as the placement "source" - this is used by a few player functions to determine things like direction
tag @a remove lockdown.placer.source
tag @s add lockdown.placer.source

# Make all placers do their thing
function lockdown:place_block/run_all_placers

# Clear advancement trigger and tags
tag @a remove lockdown.placer.source
advancement revoke @s only lockdown:hidden/place_fake_spawn_egg
