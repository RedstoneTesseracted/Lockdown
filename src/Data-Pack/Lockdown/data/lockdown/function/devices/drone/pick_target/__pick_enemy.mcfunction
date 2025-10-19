# Function macro used by pick to allow for non-hardcoded pursuit range
$execute as @e[distance=..$(range),limit=20,tag=!lockdown.exclude,type=!#lockdown:drone_ignore] run function lockdown:devices/drone/pick_target/evaluate_suspect
