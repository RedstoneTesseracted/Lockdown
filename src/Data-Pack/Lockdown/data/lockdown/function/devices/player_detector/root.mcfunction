execute if entity @a[distance=..5,gamemode=!spectator] if entity @s[tag=!lockdown.detected] run function lockdown:devices/player_detector/found_player
execute unless entity @a[distance=..5,gamemode=!spectator] if entity @s[tag=lockdown.detected] run function lockdown:devices/player_detector/no_player
execute unless block ~ ~ ~ #lockdown:redstone_output run function lockdown:devices/player_detector/destroy
