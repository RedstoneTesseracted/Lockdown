# This function runs whenever a player rejoins.
# This is mainly used to refresh recipes upon re-logging

# Reset score used to trigger this function
scoreboard players set @s lockdown.leave_game 0

# Ensure granted recipes are up-to-date
function lockdown:grant_recipes

# Set player ID if it isn't already
execute unless score @s lockdown.player_id matches -2147483648.. run function lockdown:set_player_id

# Fix zoom in/out
execute if entity @s[tag=lockdown.laser_cannon.is_riding,predicate=!lockdown:is_riding_cannon] run function lockdown:devices/laser_cannon/riding_tick
