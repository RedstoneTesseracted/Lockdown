# This function runs whenever the player clicks a carrot on a stick.
# This is used for arbitrary right-click detection

execute if items entity @s weapon.mainhand *[minecraft:custom_data~{lockdown_data:{name:"key"}}] run function lockdown:items/key/use

scoreboard players set @s lockdown.use_carrot_on_a_stick 0
