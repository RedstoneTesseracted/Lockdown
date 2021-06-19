# This function is run by the right-click detection armor stand
# If an item is in the armor stand's hand, it may indicate a right-click attempt
execute if data entity @s HandItems[0].Count run function lockdown:recipe_book_check

# Remove right-click detecting armor stands if the closest player within two blocks is not holding the recipe book
execute unless entity @p[distance=..2,nbt={SelectedItem:{id:"minecraft:book",tag:{LockdownRecipeBook:1b}}}] run kill @s
