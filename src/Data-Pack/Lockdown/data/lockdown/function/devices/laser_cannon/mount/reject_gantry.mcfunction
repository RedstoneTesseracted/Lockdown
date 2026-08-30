# This function triggers whenever the player tries to mount a gantry on to a cannon base that already has one
# This is run BY the player trying to mount the gantry

# Show help text
title @s actionbar {translate: "lockdown.messages.laser_cannon.gantry_already_present", color: "red"}

# Play effects
playsound minecraft:entity.zombie.attack_iron_door block @a ~ ~ ~ 0.5 1.0
execute at @n[tag=lockdown.context] run particle minecraft:smoke ~ ~0.25 ~ 0.5 0.5 0.5 0.0 30

# Clear state tags
tag @e[tag=lockdown.context] remove lockdown.context
