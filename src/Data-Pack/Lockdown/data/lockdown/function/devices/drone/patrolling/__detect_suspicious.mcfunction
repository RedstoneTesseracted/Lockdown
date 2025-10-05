# Function macro used by create_patrol_point for dynamic detection range

$execute as @e[type=!#lockdown:drone_ignore,distance=..$(range)] run return run function lockdown:devices/drone/patrolling/evaluate_activity
