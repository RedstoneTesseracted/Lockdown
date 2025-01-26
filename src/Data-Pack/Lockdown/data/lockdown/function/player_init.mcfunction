# Function for first-time player setup
advancement grant @s only lockdown:lockdown/root

tellraw @a [{"text":"[","color": "#00FF00"},{"text":"Lockdown","color":"light_purple"},{"text":"]: ","color": "#00FF00"},{"translate": "lockdown.messages.welcome", "fallback": "Welcome to %1$s—the datapack for all your security needs!  Open your advancements with '%2$s' for a roadmap ahead.", "with": [{"text":"Lockdown","color":"gold"},{"keybind": "key.advancements","color": "gold"}],"color":"green"},{"translate":"lockdown.messages.welcome.hidden","fallback": "  If you can read this, it means you don't have the resource pack enabled.  Don't forget to enable it!","color":"dark_green"}]
