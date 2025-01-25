# Function for first-time player setup
advancement grant @s only lockdown:lockdown/root

tellraw @a[tag=!ld_player_setup] ["",{"text":"Welcome to ","color":"green"},{"text":"Lockdown","color":"gold"},{"text":"—the datapack for all your security needs!  Open your advancements with '","color":"green"},{"keybind":"key.advancements","color":"gold"},{"text":"' for a roadmap ahead.","color":"green"}]
tag @a[tag=!ld_player_setup] add ld_player_setup
