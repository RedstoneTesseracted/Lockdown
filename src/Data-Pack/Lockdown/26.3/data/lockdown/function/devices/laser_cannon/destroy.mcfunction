# Spawn the correct item
function lockdown:drop/laser_cannon

# Play effects
playsound minecraft:block.iron.break block @a ~ ~ ~ 0.5 1.0
particle minecraft:block_crumble{block_state: {id: "minecraft:iron_block"}} ~ ~0.125 ~ 0.5 0.05 0.5 0.2 20

# Common block removal functionality
function lockdown:devices/common_destroy
