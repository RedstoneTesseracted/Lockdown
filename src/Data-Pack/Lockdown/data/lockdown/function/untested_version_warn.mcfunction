# This function warns users that they're playing on a game version that hasn't been
# tested with the pack.
# This is called upon /reload if the overlay permits it

tellraw @a {translate: "lockdown.messages.welcome.untested_game_version", color: "red", fallback: "Warning: you are playing on a game version that has not been tested with Lockdown.  You may experience bugs!"}

