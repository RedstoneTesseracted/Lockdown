# This function handles applying channel/code information to the upgraded item

# Apply channel to item
function lockdown:legacy/set_channel

# Determine if lore should say "channel" or "code" and set accordingly
# 0 = "channel"
# 1 = "code"
execute store result score lockdown.result lockdown.local run function lockdown:legacy/determine_lore
execute if score lockdown.result lockdown.local matches 0 run item modify entity @s container.0 lockdown:set_channel_lore
execute if score lockdown.result lockdown.local matches 1 run item modify entity @s container.0 lockdown:set_code_lore
