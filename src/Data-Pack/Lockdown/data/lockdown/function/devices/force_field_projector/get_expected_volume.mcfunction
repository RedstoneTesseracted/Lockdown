# This function returns the expected shield volume for a particular mode number.
# This is run BY root force field projector entity

execute if score @s lockdown.mode matches 0 run return 1
execute if score @s lockdown.mode matches 1 run return 2
execute if score @s lockdown.mode matches 2 run return 3
execute if score @s lockdown.mode matches 3 run return 4
execute if score @s lockdown.mode matches 4 run return 5
execute if score @s lockdown.mode matches 5 run return 2
execute if score @s lockdown.mode matches 6 run return 4
execute if score @s lockdown.mode matches 7 run return 6
execute if score @s lockdown.mode matches 8 run return 8
execute if score @s lockdown.mode matches 9 run return 10
execute if score @s lockdown.mode matches 10 run return 3
execute if score @s lockdown.mode matches 11 run return 6
execute if score @s lockdown.mode matches 12 run return 9
execute if score @s lockdown.mode matches 13 run return 12
execute if score @s lockdown.mode matches 14 run return 15
execute if score @s lockdown.mode matches 15 run return 4
execute if score @s lockdown.mode matches 16 run return 8
execute if score @s lockdown.mode matches 17 run return 12
execute if score @s lockdown.mode matches 18 run return 16
execute if score @s lockdown.mode matches 19 run return 20
execute if score @s lockdown.mode matches 20 run return 5
execute if score @s lockdown.mode matches 21 run return 10
execute if score @s lockdown.mode matches 22 run return 15
execute if score @s lockdown.mode matches 23 run return 20
execute if score @s lockdown.mode matches 24 run return 25

