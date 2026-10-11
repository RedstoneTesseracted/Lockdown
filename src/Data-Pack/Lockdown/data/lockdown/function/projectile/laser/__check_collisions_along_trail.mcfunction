# Function macro called by check_collisions_along_trail to ensure recursive_check_collisions_along_trail is done pointing towards the correct block

$execute facing $(x) $(y) $(z) run function lockdown:projectile/laser/recursive_check_collisions_along_trail with storage lockdown:temp args
return 1
