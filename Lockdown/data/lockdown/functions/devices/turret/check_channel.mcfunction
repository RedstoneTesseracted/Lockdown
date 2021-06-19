# Warn unauthorized players of their impending doom, unless the turret is set to non-player only.
tag @s remove ld_channel_match
execute if score @e[limit=1,sort=nearest,tag=ld_turret] ld_channel = @s ld_last_channel run tag @s add ld_channel_match
execute if score @e[limit=1,sort=nearest,tag=ld_turret] ld_channel matches 0 run tag @s add ld_channel_match
title @s[tag=!ld_channel_match] actionbar {"text":"Warning: Your most recent keycard does not match.","color":"red"}
tag @s[gamemode=creative] add ld_channel_match
tag @s[gamemode=spectator] add ld_channel_match
