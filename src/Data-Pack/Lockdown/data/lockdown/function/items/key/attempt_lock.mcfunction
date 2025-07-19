# This function attempts to apply a lock the current block.
# The locking predicate should already have been set up in ./use.mcfunction

# Case 1: block has no lock so we're free to give it one
execute unless data block ~ ~ ~ lock run return run function lockdown:items/key/apply_lock

# Case 2: block has a matching lock that should be removed
data modify storage lockdown:temp original_key set from block ~ ~ ~ lock
execute store result score lockdown.matches lockdown.local run data modify block ~ ~ ~ lock set from storage lockdown:temp key.lock
data modify block ~ ~ ~ lock set from storage lockdown:temp original_key
execute if score lockdown.matches lockdown.local matches 0 run return run function lockdown:items/key/remove_lock

# Case 3: block has a non-matching lock that this key isn't allowed to remove
title @s actionbar {translate: "lockdown.messages.key.already_locked",color:"red"}
return 0
