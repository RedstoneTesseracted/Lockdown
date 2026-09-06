# Function macro used to ensure raycast starts at correct position
$execute positioned ~ ~1.5625 ~ rotated $(azimuth) 0.0 positioned ^ ^ ^1 rotated ~ $(pitch) positioned ^ ^ ^5 run function lockdown:devices/laser_cannon/fire/damage_raycast_recursive
return 1