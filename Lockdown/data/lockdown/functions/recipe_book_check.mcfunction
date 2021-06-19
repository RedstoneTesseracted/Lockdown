# Check if the inserted item is valid
execute store result score @s ld_result run data get entity @s HandItems[0].tag.LockdownRecipeBook

# Item was not valid, eject item
execute if score @s ld_result matches 0 run data modify storage lockdown:temp Items append from entity @s HandItems[0]
execute if score @s ld_result matches 0 run function lockdown:devices/generic_eject_item

# Item was valid, cycle the book accordingly
execute if score @s ld_result matches 1 run function lockdown:recipe_book_cycle

# Remove the item from the hand slot
data remove entity @s HandItems[0]
