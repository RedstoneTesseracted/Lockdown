# This function runs the lockdown device placer entities whenever the player summons one
# It is called using an advancement trigger, and is therefore run BY and AT the player

tag @a remove lockdown.placer.source
tag @s add lockdown.placer.source
stopsound @s neutral minecraft:entity.item_frame.place
stopsound @s neutral minecraft:entity.item_frame.add_item
function lockdown:place_block/run_all_placers
tag @a remove lockdown.placer.source
advancement revoke @s only lockdown:hidden/place_fake_item_frame
