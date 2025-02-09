# This function destroys a beam if it is at least 2 ticks old
# It is run BY the laser beam entity and is called from lockdown:devices/turret/fire/scheduled_beam_destroy

execute store result score lockdown.time lockdown.local run time query gametime
scoreboard players operation lockdown.time lockdown.local -= @s lockdown.time
execute if score lockdown.time lockdown.local matches 10.. run kill @s[type=minecraft:item_display]

