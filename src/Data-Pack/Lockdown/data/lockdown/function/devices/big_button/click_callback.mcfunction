# Event handler for when an button entity is clicked
# This is called using an advancement trigger, and is therefore
# run BY and AT a player entity

# Use the timestamp to determine which entity(s) need to be processed
execute store result score lockdown.time lockdown.local run time query gametime
execute as @e[tag=lockdown.big_button,tag=lockdown.block.hitbox] store result score @s lockdown.time run data get entity @s interaction.timestamp

# Update relevant entities
execute as @e[tag=lockdown.big_button,tag=lockdown.block.hitbox] if score @s lockdown.time = lockdown.time lockdown.local at @s run function lockdown:devices/big_button/press

# Reset advancement trigger
advancement revoke @s only lockdown:hidden/interact/click_button

