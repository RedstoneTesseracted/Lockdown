# Function macro used by target_within_firing_range and target_within_pursuit_range

$execute on vehicle on target if entity @s[distance=..$(r)] run return 1
return 0
