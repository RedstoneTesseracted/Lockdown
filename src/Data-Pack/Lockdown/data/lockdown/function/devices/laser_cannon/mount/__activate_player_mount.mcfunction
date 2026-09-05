# This function macro is used to create/show the cannon charge progress bar unique to each player

# Create/configure bossbar
$bossbar add lockdown:cannon_bar_$(id) {translate: "gui.lockdown.laser_cannon.progress_bar", color: "aqua"}
$bossbar set lockdown:cannon_bar_$(id) name {translate: "gui.lockdown.laser_cannon.progress_bar", color: "aqua"}
$bossbar set lockdown:cannon_bar_$(id) style progress
$bossbar set lockdown:cannon_bar_$(id) max $(max)
$bossbar set lockdown:cannon_bar_$(id) players @s
$bossbar set lockdown:cannon_bar_$(id) color blue
$bossbar set lockdown:cannon_bar_$(id) visible true
$bossbar set lockdown:cannon_bar_$(id) value 0

return 1
