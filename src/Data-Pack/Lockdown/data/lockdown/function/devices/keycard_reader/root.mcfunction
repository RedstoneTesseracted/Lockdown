# The root keycard reader function

execute if entity @s[tag=lockdown.powered] run tag @s remove lockdown.powered
execute at @a[distance=..4,nbt={SelectedItem:{tag:{LockdownData:{id:4}}}}] if score @s ld_channel = @p[limit=1,sort=nearest,distance=..0.1] ld_channel_id run tag @s add lockdown.powered
execute if entity @s[tag=lockdown.powered] run particle minecraft:enchanted_hit ~ ~0.5 ~ 0.25 0.25 0.25 0 1
execute if entity @s[tag=lockdown.powered,tag=!ld_granted] run function lockdown:devices/keycard/grant_access
execute if entity @s[tag=!lockdown.powered,tag=ld_granted] run function lockdown:devices/keycard/revoke_access
execute unless block ~ ~ ~ #lockdown:redstone_output run function lockdown:devices/keycard_reader/destroy
