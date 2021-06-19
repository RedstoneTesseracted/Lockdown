tag @s remove ld_granted
tag @s remove ld_sending
function lockdown:devices/update_channels
execute store result entity @s ArmorItems[3].tag.CustomModelData int 1 run data get entity @s ArmorItems[3].tag.LockdownData.block_model
