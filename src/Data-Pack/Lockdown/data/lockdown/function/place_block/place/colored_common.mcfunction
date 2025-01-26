# Runs common functions amongst colorable blocks
# Expected to be run BY and AT the placer entity

execute if entity @s[tag=lockdown.color.white] run data modify entity @e[tag=lockdown.block.display.new,limit=1] item.components."minecraft:custom_model_data".strings[0] set value "white"
execute if entity @s[tag=lockdown.color.red] run data modify entity @e[tag=lockdown.block.display.new,limit=1] item.components."minecraft:custom_model_data".strings[0] set value "red"
execute if entity @s[tag=lockdown.color.orange] run data modify entity @e[tag=lockdown.block.display.new,limit=1] item.components."minecraft:custom_model_data".strings[0] set value "orange"
execute if entity @s[tag=lockdown.color.yellow] run data modify entity @e[tag=lockdown.block.display.new,limit=1] item.components."minecraft:custom_model_data".strings[0] set value "yellow"
execute if entity @s[tag=lockdown.color.green] run data modify entity @e[tag=lockdown.block.display.new,limit=1] item.components."minecraft:custom_model_data".strings[0] set value "green"
execute if entity @s[tag=lockdown.color.blue] run data modify entity @e[tag=lockdown.block.display.new,limit=1] item.components."minecraft:custom_model_data".strings[0] set value "blue"
execute if entity @s[tag=lockdown.color.light_blue] run data modify entity @e[tag=lockdown.block.display.new,limit=1] item.components."minecraft:custom_model_data".strings[0] set value "light_blue"
execute if entity @s[tag=lockdown.color.lime] run data modify entity @e[tag=lockdown.block.display.new,limit=1] item.components."minecraft:custom_model_data".strings[0] set value "lime"
execute if entity @s[tag=lockdown.color.cyan] run data modify entity @e[tag=lockdown.block.display.new,limit=1] item.components."minecraft:custom_model_data".strings[0] set value "cyan"
execute if entity @s[tag=lockdown.color.pink] run data modify entity @e[tag=lockdown.block.display.new,limit=1] item.components."minecraft:custom_model_data".strings[0] set value "pink"
execute if entity @s[tag=lockdown.color.magenta] run data modify entity @e[tag=lockdown.block.display.new,limit=1] item.components."minecraft:custom_model_data".strings[0] set value "magenta"
execute if entity @s[tag=lockdown.color.purple] run data modify entity @e[tag=lockdown.block.display.new,limit=1] item.components."minecraft:custom_model_data".strings[0] set value "purple"
execute if entity @s[tag=lockdown.color.black] run data modify entity @e[tag=lockdown.block.display.new,limit=1] item.components."minecraft:custom_model_data".strings[0] set value "black"
execute if entity @s[tag=lockdown.color.gray] run data modify entity @e[tag=lockdown.block.display.new,limit=1] item.components."minecraft:custom_model_data".strings[0] set value "gray"
execute if entity @s[tag=lockdown.color.light_gray] run data modify entity @e[tag=lockdown.block.display.new,limit=1] item.components."minecraft:custom_model_data".strings[0] set value "light_gray"
execute if entity @s[tag=lockdown.color.brown] run data modify entity @e[tag=lockdown.block.display.new,limit=1] item.components."minecraft:custom_model_data".strings[0] set value "brown"

execute if entity @s[tag=lockdown.color.white] run tag @e[tag=lockdown.block.root.new,limit=1] add lockdown.color.white
execute if entity @s[tag=lockdown.color.red] run tag @e[tag=lockdown.block.root.new,limit=1] add lockdown.color.red
execute if entity @s[tag=lockdown.color.orange] run tag @e[tag=lockdown.block.root.new,limit=1] add lockdown.color.orange
execute if entity @s[tag=lockdown.color.yellow] run tag @e[tag=lockdown.block.root.new,limit=1] add lockdown.color.yellow
execute if entity @s[tag=lockdown.color.green] run tag @e[tag=lockdown.block.root.new,limit=1] add lockdown.color.green
execute if entity @s[tag=lockdown.color.blue] run tag @e[tag=lockdown.block.root.new,limit=1] add lockdown.color.blue
execute if entity @s[tag=lockdown.color.light_blue] run tag @e[tag=lockdown.block.root.new,limit=1] add lockdown.color.light_blue
execute if entity @s[tag=lockdown.color.lime] run tag @e[tag=lockdown.block.root.new,limit=1] add lockdown.color.lime
execute if entity @s[tag=lockdown.color.cyan] run tag @e[tag=lockdown.block.root.new,limit=1] add lockdown.color.cyan
execute if entity @s[tag=lockdown.color.pink] run tag @e[tag=lockdown.block.root.new,limit=1] add lockdown.color.pink
execute if entity @s[tag=lockdown.color.magenta] run tag @e[tag=lockdown.block.root.new,limit=1] add lockdown.color.magenta
execute if entity @s[tag=lockdown.color.purple] run tag @e[tag=lockdown.block.root.new,limit=1] add lockdown.color.purple
execute if entity @s[tag=lockdown.color.black] run tag @e[tag=lockdown.block.root.new,limit=1] add lockdown.color.black
execute if entity @s[tag=lockdown.color.gray] run tag @e[tag=lockdown.block.root.new,limit=1] add lockdown.color.gray
execute if entity @s[tag=lockdown.color.light_gray] run tag @e[tag=lockdown.block.root.new,limit=1] add lockdown.color.light_gray
execute if entity @s[tag=lockdown.color.brown] run tag @e[tag=lockdown.block.root.new,limit=1] add lockdown.color.brown
