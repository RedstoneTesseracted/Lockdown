# This function is used by lockdown:items/upgrade/use to determine what entity the player clicked on.
# It works by running through all possible candidates and using a predicate to check whether the
# player is looking at a candidate.
#
# This is run BY and AT the player
#
# The final chosen target (if it exists) is given the "lockdown.context" tag

# Reset tags
tag @e remove lockdown.candidate
tag @e remove lockdown.candidate.current
tag @e remove lockdown.context

# Mark nearby candidates
execute store result storage lockdown:temp args.reach float 0.001 run attribute @s minecraft:entity_interaction_range get 1000.0
scoreboard players set lockdown.candidate_id lockdown.local 0
execute store result score lockdown.result lockdown.local run function lockdown:items/upgrade/mark_nearby_candidates with storage lockdown:temp args

# mark_nearby_candidates should NEVER return a zero (if it does, it means the function macro has broken)
execute unless score lockdown.result lockdown.local matches 1 run title @s actionbar {translate: "lockdown.messages.bug.macro.generic", fallback: "If you can read this, something has gone wrong with %1$s", color: "red", with: [{text: "lockdown:items/upgrade/mark_nearby_candidates",underlined: false, color: "gray"}]}

# Check all possible candidates
tag @s add lockdown.context
execute as @e[tag=lockdown.candidate] if function lockdown:items/upgrade/is_being_looked_at run tag @s add lockdown.candidate.valid
tag @s remove lockdown.context

# THERE CAN ONLY BE ONE
tag @e[tag=lockdown.candidate.valid,limit=1] add lockdown.context
tag @e remove lockdown.candidate.valid

# Shift context to root block entity
# Possible cases that I've accounted for here (not all of these are used):
#   * Root entity is riding a passenger of the context
#   * Root entity is riding the context
#   * Root entity is the context
#   * Context is riding root entity
#   * Context is a passenger of a passenger of the root entity
execute as @e[tag=lockdown.context] on passengers on passengers run tag @s[tag=lockdown.block.root] add lockdown.shift_context
execute as @e[tag=lockdown.context] on passengers run tag @s[tag=lockdown.block.root] add lockdown.shift_context
execute as @e[tag=lockdown.context,tag=lockdown.block.root] run tag @s add lockdown.shift_context
execute as @e[tag=lockdown.context] on vehicle if entity @s[tag=lockdown.block.root] run tag @s add lockdown.shift_context
execute as @e[tag=lockdown.context] on vehicle on vehicle if entity @s[tag=lockdown.block.root] run tag @s add lockdown.shift_context
tag @e[tag=lockdown.context] remove lockdown.context
tag @e[tag=lockdown.shift_context] add lockdown.context
tag @e[tag=lockdown.shift_context] remove lockdown.shift_context

# Reset tags
tag @e remove lockdown.candidate

# Return result code
execute if entity @e[tag=lockdown.context] run return 1
return 0
