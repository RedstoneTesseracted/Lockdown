# This function update the player's laser blaster heat score and displays the result

scoreboard players remove @s lockdown.laser_blaster.heat 1

execute if score @s lockdown.laser_blaster.heat <= lockdown.laser_blaster.max_heat lockdown.constant run title @s actionbar {translate: "lockdown.messages.laser_blaster.heat", color: "blue", with: [{score: {name: "@s", objective: "lockdown.laser_blaster.heat"}, color: "gold"}]}
execute if score @s lockdown.laser_blaster.heat > lockdown.laser_blaster.max_heat lockdown.constant run title @s actionbar {translate: "lockdown.messages.laser_blaster.overheat", color: "red", with: [{score: {name: "@s", objective: "lockdown.laser_blaster.heat"}, color: "gold"}]}
