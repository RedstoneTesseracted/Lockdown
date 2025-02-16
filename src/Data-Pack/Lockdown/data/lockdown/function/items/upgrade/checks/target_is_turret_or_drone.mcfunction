# Checks if the entity marked by the "lockdown.context" tag is a turret or drone and returns the result

execute if function lockdown:items/upgrade/checks/target_is_drone run return 1
execute if function lockdown:items/upgrade/checks/target_is_turret run return 1
return 0
