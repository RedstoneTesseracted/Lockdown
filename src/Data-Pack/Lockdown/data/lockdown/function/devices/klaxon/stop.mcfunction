# This function handles the klaxon's deactivation

tag @s remove lockdown.powered
data modify entity @s item.components."minecraft:item_model" set value "lockdown:machine/klaxon_off"
stopsound @a[distance=..20] block lockdown:alarm.alarm1
stopsound @a[distance=..20] block lockdown:alarm.alarm2
stopsound @a[distance=..20] block lockdown:alarm.industrial_alarm
stopsound @a[distance=..20] block minecraft:entity.elder_guardian.curse
stopsound @a[distance=..20] block minecraft:entity.guardian.death
stopsound @a[distance=..20] block minecraft:block.bell.use
