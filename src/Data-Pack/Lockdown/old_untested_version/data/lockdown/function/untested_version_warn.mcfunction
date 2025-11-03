# This function warns users that they're playing on a game version that hasn't been
# tested with the pack.
# This is called upon /reload if the overlay permits it

tellraw @a {"translate": "lockdown.messages.welcome.incompatible_game_version", "color": "red", "fallback": "Error: this game version is incompatible with the Lockdown datapack.  Lockdown has automatically disabled itself"}

