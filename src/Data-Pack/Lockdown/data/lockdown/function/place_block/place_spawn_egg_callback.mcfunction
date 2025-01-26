# This function runs the lockdown device placer entities whenever the player summons one
# It is called using an advancement trigger, and is therefore run BY and AT the player

tag @a remove lockdown.placer.source
tag @s add lockdown.placer.source
function lockdown:place_block/run_all_placers
tag @a remove lockdown.placer.source
advancement revoke @s only lockdown:hidden/place_fake_spawn_egg
