execute if entity @a[distance=..5,gamemode=!spectator] if entity @s[tag=!ld_found_player] run function lockdown:devices/player_detector/found_player
execute unless entity @a[distance=..5,gamemode=!spectator] if entity @s[tag=ld_found_player] run function lockdown:devices/player_detector/no_player
execute unless block ~ ~ ~ #lockdown:redstone_output run function lockdown:devices/player_detector/player_detector_destroy
