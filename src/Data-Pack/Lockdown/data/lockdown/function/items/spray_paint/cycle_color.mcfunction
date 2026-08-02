# This function cycles the spray can's color

playsound lockdown:spray_can.shake player @a ~ ~ ~ 1 1

# Main hand gets priority
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=16383998] run return run item modify entity @s weapon.mainhand lockdown:spray_can/yellow
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=16701501] run return run item modify entity @s weapon.mainhand lockdown:spray_can/black
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=1908001] run return run item modify entity @s weapon.mainhand lockdown:spray_can/blue
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=3949738] run return run item modify entity @s weapon.mainhand lockdown:spray_can/brown
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=8606770] run return run item modify entity @s weapon.mainhand lockdown:spray_can/cyan
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=1481884] run return run item modify entity @s weapon.mainhand lockdown:spray_can/gray
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=4673362] run return run item modify entity @s weapon.mainhand lockdown:spray_can/green
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=6192150] run return run item modify entity @s weapon.mainhand lockdown:spray_can/light_blue
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=3847130] run return run item modify entity @s weapon.mainhand lockdown:spray_can/light_gray
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=10329495] run return run item modify entity @s weapon.mainhand lockdown:spray_can/lime
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=8439583] run return run item modify entity @s weapon.mainhand lockdown:spray_can/magenta
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=13061821] run return run item modify entity @s weapon.mainhand lockdown:spray_can/orange
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=16351261] run return run item modify entity @s weapon.mainhand lockdown:spray_can/pink
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=15961002] run return run item modify entity @s weapon.mainhand lockdown:spray_can/purple
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=8991416] run return run item modify entity @s weapon.mainhand lockdown:spray_can/red
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=11546150] run return run item modify entity @s weapon.mainhand lockdown:spray_can/white

# Also possible to be holding spray can in off-hand
execute if items entity @s weapon.offhand *[minecraft:dyed_color=16383998] run return run item modify entity @s weapon.offhand lockdown:spray_can/yellow
execute if items entity @s weapon.offhand *[minecraft:dyed_color=16701501] run return run item modify entity @s weapon.offhand lockdown:spray_can/black
execute if items entity @s weapon.offhand *[minecraft:dyed_color=1908001] run return run item modify entity @s weapon.offhand lockdown:spray_can/blue
execute if items entity @s weapon.offhand *[minecraft:dyed_color=3949738] run return run item modify entity @s weapon.offhand lockdown:spray_can/brown
execute if items entity @s weapon.offhand *[minecraft:dyed_color=8606770] run return run item modify entity @s weapon.offhand lockdown:spray_can/cyan
execute if items entity @s weapon.offhand *[minecraft:dyed_color=1481884] run return run item modify entity @s weapon.offhand lockdown:spray_can/gray
execute if items entity @s weapon.offhand *[minecraft:dyed_color=4673362] run return run item modify entity @s weapon.offhand lockdown:spray_can/green
execute if items entity @s weapon.offhand *[minecraft:dyed_color=6192150] run return run item modify entity @s weapon.offhand lockdown:spray_can/light_blue
execute if items entity @s weapon.offhand *[minecraft:dyed_color=3847130] run return run item modify entity @s weapon.offhand lockdown:spray_can/light_gray
execute if items entity @s weapon.offhand *[minecraft:dyed_color=10329495] run return run item modify entity @s weapon.offhand lockdown:spray_can/lime
execute if items entity @s weapon.offhand *[minecraft:dyed_color=8439583] run return run item modify entity @s weapon.offhand lockdown:spray_can/magenta
execute if items entity @s weapon.offhand *[minecraft:dyed_color=13061821] run return run item modify entity @s weapon.offhand lockdown:spray_can/orange
execute if items entity @s weapon.offhand *[minecraft:dyed_color=16351261] run return run item modify entity @s weapon.offhand lockdown:spray_can/pink
execute if items entity @s weapon.offhand *[minecraft:dyed_color=15961002] run return run item modify entity @s weapon.offhand lockdown:spray_can/purple
execute if items entity @s weapon.offhand *[minecraft:dyed_color=8991416] run return run item modify entity @s weapon.offhand lockdown:spray_can/red
execute if items entity @s weapon.offhand *[minecraft:dyed_color=11546150] run return run item modify entity @s weapon.offhand lockdown:spray_can/white
