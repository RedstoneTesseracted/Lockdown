# Run when a lockdown device CANNOT be placed in a spot.  Handles re-spawning the item
# Run BY and AT the placer entity

$title @a[tag=lockdown.placer.source] actionbar {translate: "$(msg)",color: "red"}

# Play effects
execute align xyz run particle minecraft:block{block_state:{Name:"minecraft:iron_block"}} ~0.5 ~0.5 ~0.5 0.25 0.25 0.25 1 20
playsound minecraft:entity.zombie.attack_wooden_door block @a ~ ~ ~ 0.25 1.6

# Do not drop item if source player is in creative mode
execute if entity @a[tag=lockdown.placer.source,gamemode=creative] run return 0

function lockdown:drop/alarm
