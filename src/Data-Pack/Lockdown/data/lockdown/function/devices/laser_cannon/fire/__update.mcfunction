$execute store result bossbar lockdown:cannon_bar_$(id) value run scoreboard players get @s lockdown.cannon.charge
$execute store result bossbar lockdown:cannon_bar_$(id) max run scoreboard players get lockdown.cannon_max_charge lockdown.constant

return 1
