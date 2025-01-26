# This function handles updating the button's properties when pressed
# It is called BY and AT the root button entity

# Abort early if button is already pressed
execute if entity @s[tag=lockdown.powered] run return 0

# Update model and properties
item modify entity @s container.0 lockdown:state/first_flag_true
tag @s add lockdown.powered
scoreboard players set @s lockdown.press_time 0

# Update wireless channels
function lockdown:channels/start_broadcast

# Play effects
execute if score @s lockdown.channel matches 1.. run particle minecraft:enchanted_hit ~ ~0.23 ~ 0.4 0.4 0.4 0 3
playsound minecraft:block.wooden_trapdoor.open block @a ~ ~ ~ 1 0.0
stopsound @a[distance=..10] block minecraft:block.wooden_button.click_on
