# This function runs whenever a player rejoins.
# This is mainly used to refresh recipes upon re-logging

# Reset score used to trigger this function
scoreboard players set @s lockdown.leave_game 0

# Ensure granted recipes are up-to-date
function lockdown:grant_recipes
