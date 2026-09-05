# This function assigns a unique positive integer to the player using a global counter

scoreboard players operation @s lockdown.player_id = lockdown.player_id_counter lockdown.global
scoreboard players add lockdown.player_id_counter lockdown.global 1
