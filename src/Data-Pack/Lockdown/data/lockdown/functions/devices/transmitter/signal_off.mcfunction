tag @s remove ld_sending
execute store result entity @s ArmorItems[3].tag.CustomModelData int 1 run data get entity @s ArmorItems[3].tag.LockdownData.block_model
function lockdown:devices/update_channels
