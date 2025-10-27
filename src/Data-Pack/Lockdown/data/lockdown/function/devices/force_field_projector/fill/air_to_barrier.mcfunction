# This function is used to fill the force field with barrier blocks.
# The number of blocks placed is returned
# This is run BY and AT the force field root entity

execute if score @s lockdown.active_mode matches 0 on passengers if entity @s[tag=lockdown.force_field_projector.shield] at @s positioned ~ ~1 ~ run return run fill ^ ^ ^ ^ ^ ^ minecraft:barrier replace minecraft:air
execute if score @s lockdown.active_mode matches 1 on passengers if entity @s[tag=lockdown.force_field_projector.shield] at @s positioned ~ ~1 ~ run return run fill ^ ^ ^ ^ ^1 ^ minecraft:barrier replace minecraft:air
execute if score @s lockdown.active_mode matches 2 on passengers if entity @s[tag=lockdown.force_field_projector.shield] at @s positioned ~ ~1 ~ run return run fill ^ ^ ^ ^ ^2 ^ minecraft:barrier replace minecraft:air
execute if score @s lockdown.active_mode matches 3 on passengers if entity @s[tag=lockdown.force_field_projector.shield] at @s positioned ~ ~1 ~ run return run fill ^ ^ ^ ^ ^3 ^ minecraft:barrier replace minecraft:air
execute if score @s lockdown.active_mode matches 4 on passengers if entity @s[tag=lockdown.force_field_projector.shield] at @s positioned ~ ~1 ~ run return run fill ^ ^ ^ ^ ^4 ^ minecraft:barrier replace minecraft:air
execute if score @s lockdown.active_mode matches 5 on passengers if entity @s[tag=lockdown.force_field_projector.shield] at @s positioned ~ ~1 ~ run return run fill ^ ^ ^ ^1 ^ ^ minecraft:barrier replace minecraft:air
execute if score @s lockdown.active_mode matches 6 on passengers if entity @s[tag=lockdown.force_field_projector.shield] at @s positioned ~ ~1 ~ run return run fill ^ ^ ^ ^1 ^1 ^ minecraft:barrier replace minecraft:air
execute if score @s lockdown.active_mode matches 7 on passengers if entity @s[tag=lockdown.force_field_projector.shield] at @s positioned ~ ~1 ~ run return run fill ^ ^ ^ ^1 ^2 ^ minecraft:barrier replace minecraft:air
execute if score @s lockdown.active_mode matches 8 on passengers if entity @s[tag=lockdown.force_field_projector.shield] at @s positioned ~ ~1 ~ run return run fill ^ ^ ^ ^1 ^3 ^ minecraft:barrier replace minecraft:air
execute if score @s lockdown.active_mode matches 9 on passengers if entity @s[tag=lockdown.force_field_projector.shield] at @s positioned ~ ~1 ~ run return run fill ^ ^ ^ ^1 ^4 ^ minecraft:barrier replace minecraft:air
execute if score @s lockdown.active_mode matches 10 on passengers if entity @s[tag=lockdown.force_field_projector.shield] at @s positioned ~ ~1 ~ run return run fill ^-1 ^ ^ ^1 ^ ^ minecraft:barrier replace minecraft:air
execute if score @s lockdown.active_mode matches 11 on passengers if entity @s[tag=lockdown.force_field_projector.shield] at @s positioned ~ ~1 ~ run return run fill ^-1 ^ ^ ^1 ^1 ^ minecraft:barrier replace minecraft:air
execute if score @s lockdown.active_mode matches 12 on passengers if entity @s[tag=lockdown.force_field_projector.shield] at @s positioned ~ ~1 ~ run return run fill ^-1 ^ ^ ^1 ^2 ^ minecraft:barrier replace minecraft:air
execute if score @s lockdown.active_mode matches 13 on passengers if entity @s[tag=lockdown.force_field_projector.shield] at @s positioned ~ ~1 ~ run return run fill ^-1 ^ ^ ^1 ^3 ^ minecraft:barrier replace minecraft:air
execute if score @s lockdown.active_mode matches 14 on passengers if entity @s[tag=lockdown.force_field_projector.shield] at @s positioned ~ ~1 ~ run return run fill ^-1 ^ ^ ^1 ^4 ^ minecraft:barrier replace minecraft:air
execute if score @s lockdown.active_mode matches 15 on passengers if entity @s[tag=lockdown.force_field_projector.shield] at @s positioned ~ ~1 ~ run return run fill ^-1 ^ ^ ^2 ^ ^ minecraft:barrier replace minecraft:air
execute if score @s lockdown.active_mode matches 16 on passengers if entity @s[tag=lockdown.force_field_projector.shield] at @s positioned ~ ~1 ~ run return run fill ^-1 ^ ^ ^2 ^1 ^ minecraft:barrier replace minecraft:air
execute if score @s lockdown.active_mode matches 17 on passengers if entity @s[tag=lockdown.force_field_projector.shield] at @s positioned ~ ~1 ~ run return run fill ^-1 ^ ^ ^2 ^2 ^ minecraft:barrier replace minecraft:air
execute if score @s lockdown.active_mode matches 18 on passengers if entity @s[tag=lockdown.force_field_projector.shield] at @s positioned ~ ~1 ~ run return run fill ^-1 ^ ^ ^2 ^3 ^ minecraft:barrier replace minecraft:air
execute if score @s lockdown.active_mode matches 19 on passengers if entity @s[tag=lockdown.force_field_projector.shield] at @s positioned ~ ~1 ~ run return run fill ^-1 ^ ^ ^2 ^4 ^ minecraft:barrier replace minecraft:air
execute if score @s lockdown.active_mode matches 20 on passengers if entity @s[tag=lockdown.force_field_projector.shield] at @s positioned ~ ~1 ~ run return run fill ^-2 ^ ^ ^2 ^ ^ minecraft:barrier replace minecraft:air
execute if score @s lockdown.active_mode matches 21 on passengers if entity @s[tag=lockdown.force_field_projector.shield] at @s positioned ~ ~1 ~ run return run fill ^-2 ^ ^ ^2 ^1 ^ minecraft:barrier replace minecraft:air
execute if score @s lockdown.active_mode matches 22 on passengers if entity @s[tag=lockdown.force_field_projector.shield] at @s positioned ~ ~1 ~ run return run fill ^-2 ^ ^ ^2 ^2 ^ minecraft:barrier replace minecraft:air
execute if score @s lockdown.active_mode matches 23 on passengers if entity @s[tag=lockdown.force_field_projector.shield] at @s positioned ~ ~1 ~ run return run fill ^-2 ^ ^ ^2 ^3 ^ minecraft:barrier replace minecraft:air
execute if score @s lockdown.active_mode matches 24 on passengers if entity @s[tag=lockdown.force_field_projector.shield] at @s positioned ~ ~1 ~ run return run fill ^-2 ^ ^ ^2 ^4 ^ minecraft:barrier replace minecraft:air
