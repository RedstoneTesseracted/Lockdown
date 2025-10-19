# Macro used by several target_within_*_range functions

$execute on vehicle on target if entity @s[distance=..$(r)] unless data entity @s {Health: 0.0f} run return 1
return 0
