# This function is run when the force field doesn't have enough room to spawn itself
title @a[distance=..5] actionbar {translate:"lockdown.messages.force_field_projector.obstructed",color:"red"}
playsound minecraft:entity.blaze.hurt block @a ~ ~ ~ 0.75 0.0
tag @s add lockdown.blocked
