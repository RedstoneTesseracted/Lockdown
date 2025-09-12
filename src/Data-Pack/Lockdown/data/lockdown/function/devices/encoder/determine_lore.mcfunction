# Identifies whether an encoded item should say "channel" or "code"
# in its lore.  This function is auto-generated using a script that
# bases its results off of the defined recipes.
# 0 = "channel"
# 1 = "code"

# By item group
execute if items block ~ ~ ~ container.4 *[minecraft:custom_data~{lockdown_data:{group:"alarms"}}] run return 0
execute if items block ~ ~ ~ container.4 *[minecraft:custom_data~{lockdown_data:{group:"buttons"}}] run return 0
execute if items block ~ ~ ~ container.4 *[minecraft:custom_data~{lockdown_data:{group:"keycards"}}] run return 1

# By item name
execute if items block ~ ~ ~ container.4 *[minecraft:custom_data~{lockdown_data:{name:"control_tower"}}] run return 1
execute if items block ~ ~ ~ container.4 *[minecraft:custom_data~{lockdown_data:{name:"drone"}}] run return 1
execute if items block ~ ~ ~ container.4 *[minecraft:custom_data~{lockdown_data:{name:"key"}}] run return 1
execute if items block ~ ~ ~ container.4 *[minecraft:custom_data~{lockdown_data:{name:"keycard_reader"}}] run return 1
execute if items block ~ ~ ~ container.4 *[minecraft:custom_data~{lockdown_data:{name:"turret"}}] run return 1
execute if items block ~ ~ ~ container.4 *[minecraft:custom_data~{lockdown_data:{name:"wireless_receiver"}}] run return 0
execute if items block ~ ~ ~ container.4 *[minecraft:custom_data~{lockdown_data:{name:"wireless_transmitter"}}] run return 0

# Default case
return 0
