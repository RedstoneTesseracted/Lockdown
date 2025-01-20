# This function runs the shine effect from powered alarms
# Summon the shine effect if one is not already present
execute unless entity @e[type=armor_stand,tag=ld_glow_effect,distance=..0.1] run function lockdown:devices/alarm/alarm_shine_summon
