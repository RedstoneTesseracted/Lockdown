# Run when a lockdown device CANNOT be placed in a spot.  Handles re-spawning the item
# Run BY and AT the placer entity

$title @a[tag=lockdown.placer.source] actionbar {translate: "$(msg)",color: "red"}

# Play effects
execute align xyz run particle minecraft:block{block_state:{Name:"minecraft:iron_block"}} ~0.5 ~0.5 ~0.5 0.25 0.25 0.25 1 20
playsound minecraft:entity.zombie.attack_wooden_door block @a ~ ~ ~ 0.25 1.6

# Do not drop item if source player is in creative mode
execute if entity @a[tag=lockdown.placer.source,gamemode=creative] run return 0

execute align xyz if entity @s[tag=lockdown.color.white] run loot spawn ~0.5 ~0.5 ~0.5 loot lockdown:drop/alarm/white_alarm
execute align xyz if entity @s[tag=lockdown.color.red] run loot spawn ~0.5 ~0.5 ~0.5 loot lockdown:drop/alarm/red_alarm
execute align xyz if entity @s[tag=lockdown.color.orange] run loot spawn ~0.5 ~0.5 ~0.5 loot lockdown:drop/alarm/orange_alarm
execute align xyz if entity @s[tag=lockdown.color.yellow] run loot spawn ~0.5 ~0.5 ~0.5 loot lockdown:drop/alarm/yellow_alarm
execute align xyz if entity @s[tag=lockdown.color.green] run loot spawn ~0.5 ~0.5 ~0.5 loot lockdown:drop/alarm/green_alarm
execute align xyz if entity @s[tag=lockdown.color.blue] run loot spawn ~0.5 ~0.5 ~0.5 loot lockdown:drop/alarm/blue_alarm
execute align xyz if entity @s[tag=lockdown.color.light_blue] run loot spawn ~0.5 ~0.5 ~0.5 loot lockdown:drop/alarm/light_blue_alarm
execute align xyz if entity @s[tag=lockdown.color.lime] run loot spawn ~0.5 ~0.5 ~0.5 loot lockdown:drop/alarm/lime_alarm
execute align xyz if entity @s[tag=lockdown.color.cyan] run loot spawn ~0.5 ~0.5 ~0.5 loot lockdown:drop/alarm/cyan_alarm
execute align xyz if entity @s[tag=lockdown.color.pink] run loot spawn ~0.5 ~0.5 ~0.5 loot lockdown:drop/alarm/pink_alarm
execute align xyz if entity @s[tag=lockdown.color.magenta] run loot spawn ~0.5 ~0.5 ~0.5 loot lockdown:drop/alarm/magenta_alarm
execute align xyz if entity @s[tag=lockdown.color.purple] run loot spawn ~0.5 ~0.5 ~0.5 loot lockdown:drop/alarm/purple_alarm
execute align xyz if entity @s[tag=lockdown.color.black] run loot spawn ~0.5 ~0.5 ~0.5 loot lockdown:drop/alarm/black_alarm
execute align xyz if entity @s[tag=lockdown.color.gray] run loot spawn ~0.5 ~0.5 ~0.5 loot lockdown:drop/alarm/gray_alarm
execute align xyz if entity @s[tag=lockdown.color.light_gray] run loot spawn ~0.5 ~0.5 ~0.5 loot lockdown:drop/alarm/light_gray_alarm
execute align xyz if entity @s[tag=lockdown.color.brown] run loot spawn ~0.5 ~0.5 ~0.5 loot lockdown:drop/alarm/brown_alarm
