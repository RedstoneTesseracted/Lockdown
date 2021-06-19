execute if entity @s[tag=ld_found_card] run tag @s remove ld_found_card
execute at @a[distance=..4] if score @s ld_channel = @p[limit=1,sort=nearest,nbt={SelectedItem:{tag:{LockdownData:{id:4}}}}] ld_channel_id run tag @s add ld_found_card
execute if entity @s[tag=ld_found_card] run particle minecraft:enchanted_hit ~ ~0.5 ~ 0.25 0.25 0.25 0 1
execute if entity @s[tag=ld_found_card,tag=!ld_granted] run function lockdown:devices/keycard/grant_access
execute if entity @s[tag=!ld_found_card,tag=ld_granted] run function lockdown:devices/keycard/revoke_access
execute unless block ~ ~ ~ minecraft:acacia_button run function lockdown:devices/keycard/keycard_reader_destroy
