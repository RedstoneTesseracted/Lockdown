# Ensure a right-click-detecting armor stand is at the player
execute unless entity @e[type=minecraft:armor_stand,tag=ld_click_detector,distance=..2] run summon minecraft:armor_stand ~ ~ ~ {Tags:["ld_click_detector"],ShowArms:1b,Invisible:1b,NoGravity:1b,DisabledSlots:1973790}
execute as @e[type=minecraft:armor_stand,tag=ld_click_detector] at @s at @p[distance=..2,nbt={SelectedItem:{id:"minecraft:book",tag:{LockdownRecipeBook:1b}}}] run tp @s ~ ~ ~ ~ ~
