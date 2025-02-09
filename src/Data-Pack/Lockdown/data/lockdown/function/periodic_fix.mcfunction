# This function contains various fixes for unlikely problems that would
# ordinarily soft-lock the player.
# The necessity of this is questionable, but we check anyways just to be safe.

# You shouldn't have those
function lockdown:clear_forbidden

# Reset advancement triggers
advancement revoke @a through lockdown:hidden/root

# Eliminate temporary beam entities that somehow got left over
function lockdown:devices/turret/fire/scheduled_beam_destroy

# Schedule this function to run again
schedule function lockdown:periodic_fix 0.5d replace
