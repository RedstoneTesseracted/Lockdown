# This function is used by lockdown:items/upgrade/find_target to check whether the player
# is looking at a particular entity candidate
#
# This is run BY the candidate.  The player has the lockdown.context tag

tag @s add lockdown.candidate.current
scoreboard players set lockdown.result lockdown.local 0
execute as @a[tag=lockdown.context,limit=1] if predicate lockdown:looking_at_candidate run scoreboard players set lockdown.result lockdown.local 1
tag @s remove lockdown.candidate.current
tag @s remove lockdown.candidate

return run scoreboard players get lockdown.result lockdown.local
