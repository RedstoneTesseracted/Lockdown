# Function for first-time player setup

# Scores
execute store result score @s lockdown.uuid1 run data get entity @s UUID[0]
execute store result score @s lockdown.uuid2 run data get entity @s UUID[1]
execute store result score @s lockdown.uuid3 run data get entity @s UUID[2]
execute store result score @s lockdown.uuid4 run data get entity @s UUID[3]

# Welcome message/advancement
advancement grant @s only lockdown:lockdown/root
tellraw @a [{text:"[",color: "#00FF00"},{text:"Lockdown",color:"light_purple"},{text:"]: ",color: "#00FF00"},{translate: "lockdown.messages.welcome", fallback: "Welcome to %1$s—the datapack for all your security needs!  Open your advancements with '%2$s' for a roadmap ahead.", with: [{text:"Lockdown",color:"gold"},{keybind: "key.advancements",color: "gold"}],color:"green"},{translate:"lockdown.messages.welcome.hidden",fallback: "  If you can read this, it means you don't have the resource pack enabled.  Don't forget to enable it!",color:"dark_green"}]
