# Run when a lockdown device CANNOT be placed in a spot.  Handles re-spawning the item
# Run BY and AT the placer entity

$title @a[tag=lockdown.placer.source] actionbar {translate: "$(msg)",color: "red"}

# Play effects
execute align xyz run particle minecraft:block{block_state:{Name:"minecraft:iron_block"}} ~0.5 ~0.5 ~0.5 0.25 0.25 0.25 1 20
playsound minecraft:entity.zombie.attack_wooden_door block @a ~ ~ ~ 0.25 1.6

# Do not drop item if source player is in creative mode
execute if entity @a[tag=lockdown.placer.source,gamemode=creative] run return 0
$loot spawn ~ ~ ~ loot $(loot)

# Assign channel/code if applicable
#tag @e[distance=..0,sort=nearest,type=minecraft:item] add lockdown.reject_spawned_item
#execute if data entity @s data.lockdown_data.channel store result score lockdown.channel lockdown.local run data get entity @s data.lockdown_data.channel
#execute if data entity @s data.lockdown_data.channel as @e[tag=lockdown.reject_spawned_item] store result entity @s Item.components."minecraft:entity_data".data.lockdown_data.channel int 1 run scoreboard players get lockdown.channel lockdown.local
#tag @e[tag=lockdown.reject_spawned_item] remove lockdown.reject_spawned_item
