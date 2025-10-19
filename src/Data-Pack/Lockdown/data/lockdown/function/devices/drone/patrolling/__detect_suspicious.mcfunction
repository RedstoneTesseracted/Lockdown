# Function macro used by create_patrol_point for dynamic detection range

$execute as @e[type=!#lockdown:drone_ignore,tag=!lockdown.exclude,distance=0.65..$(range)] run function lockdown:devices/drone/patrolling/evaluate_activity
