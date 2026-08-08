# This function is called by lockdown:items/spray_paint/use to apply spray paint to an entity.
# This is run BY and AT the entity being painted.

# Apply to all paintable entities within this stack of passengers/vehicles
scoreboard players set lockdown.success lockdown.local 0
execute on vehicle if entity @s[tag=lockdown.block.display] if function lockdown:items/spray_paint/is_paintable run function lockdown:items/spray_paint/apply_to_display
execute if entity @s[tag=lockdown.block.display] if function lockdown:items/spray_paint/is_paintable run function lockdown:items/spray_paint/apply_to_display
execute on passengers if entity @s[tag=lockdown.block.display] if function lockdown:items/spray_paint/is_paintable run function lockdown:items/spray_paint/apply_to_display

# Show effects on successful painting
execute unless score lockdown.success lockdown.local matches 1 run return 0
scoreboard players set lockdown.result lockdown.local 0
execute store result score lockdown.result lockdown.local run function lockdown:items/spray_paint/particles with storage lockdown:temp paint
execute if score lockdown.result lockdown.local matches 0 run tellraw @p {translate: "lockdown.messages.bug.macro.generic",color: "red", with: [{text: "lockdown:items/spray_paint/particles", color: "gray", underlined: true}]}


return 1
