# This function runs whenever a player rejoins.
# This is mainly used to refresh recipes upon re-logging

# Reset score used to trigger this function
scoreboard players set @s lockdown.leave_game 0

# Ensure granted recipes are up-to-date
function lockdown:grant_recipes

# Fix zoom in/out
execute if entity @s[tag=lockdown.laser_cannon.zoom_out,predicate=!lockdown:is_riding_cannon] run function lockdown:devices/laser_cannon/riding_tick
