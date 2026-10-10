# Function macro that selects targets within range
# Called from lockdown:devices/turret/pick_target BY and AT the turret base entity

# Evaluate all entities within range
$execute as @e[distance=0.1..$(range)] if function lockdown:devices/turret/pick_target/evaluate_target run tag @s add lockdown.turret.candidate
