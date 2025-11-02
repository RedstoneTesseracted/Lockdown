# Replace the item in the given slot
function lockdown:craft/secure_book_recursive

# Reset the player's craft_crafter status
scoreboard players set @s ld_craft_book 0
