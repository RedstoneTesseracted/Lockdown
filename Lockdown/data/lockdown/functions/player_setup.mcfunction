# Function for player setup
advancement grant @s only lockdown:lockdown/root
recipe give @s lockdown:secure_crafting_table
recipe give @s lockdown:secure_recipe_book

tellraw @a ["",{"text":"Welcome to ","color":"green"},{"text":"Lockdown","color":"gold"},{"text":"—the datapack for all your security needs!  Open your advancements with '","color":"green"},{"keybind":"key.advancements","color":"gold"},{"text":"' for a roadmap ahead.","color":"green"}]
