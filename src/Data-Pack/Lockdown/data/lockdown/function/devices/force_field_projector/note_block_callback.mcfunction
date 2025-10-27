# This function is used to display text indicating the force-field's size
# It is called using an advancement trigger whenever a player interacts with
# a note block.

# Tag this player with a context tag
tag @s add lockdown.force_field_projector.context

# Check for any nearby force fields whose mode doesn't match its actual state
# We take the player's block reach into account for this
data modify storage lockdown:temp args set value {r: 0.0f}
execute store result storage lockdown:temp args.r float 0.001 run attribute @s minecraft:block_interaction_range get 1000.0
function lockdown:devices/force_field_projector/__note_block_callback with storage lockdown:temp args

# Reset advancement trigger/tags
tag @s remove lockdown.force_field_projector.context
advancement revoke @s only lockdown:hidden/use_noteblock
