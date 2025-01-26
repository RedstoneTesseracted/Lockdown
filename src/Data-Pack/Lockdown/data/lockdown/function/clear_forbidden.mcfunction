# This function clears all forbidden items (such as GUI items) from all player's inventories
# It is called using an advancement trigger

clear @s *[minecraft:custom_data~{lockdown_data:{forbidden:1b}}]
advancement revoke @s only lockdown:hidden/forbidden
