# This function applies the durability upgrade to a turret/drone

# Check if chosen entity is applicable for this upgrade
execute unless function lockdown:items/upgrade/checks/target_is_turret_or_drone run return run title @s actionbar {"translate": "lockdown.messages.upgrade.not_eligible","color": "red", "with": [{"translate": "item.lockdown.upgrade.durability"}]}
execute if function lockdown:items/upgrade/checks/max_durability_upgrades run return run title @s actionbar {"translate": "lockdown.messages.upgrade.max_upgraded","color": "red", "with": [{"translate": "item.lockdown.upgrade.durability"}]}

# Apply upgrade to chosen entity
# Note: context is ALWAYS the root block entity
scoreboard players add @e[tag=lockdown.context,limit=1] lockdown.upgrades.durability 1
execute store result storage lockdown:temp args.health float 3.0 run scoreboard players get @e[tag=lockdown.context,limit=1] lockdown.upgrades.durability
execute as @e[tag=lockdown.context,limit=1] on passengers if entity @s[tag=lockdown.block.hitbox] store result score lockdown.macro_status lockdown.local run function lockdown:items/upgrade/apply/__durability with storage lockdown:temp args
execute as @e[tag=lockdown.context,limit=1] on passengers if entity @s[tag=lockdown.block.hitbox] unless score lockdown.macro_status lockdown.local matches 1 run tellraw @p {"translate": "lockdown.messages.bug.macro.generic", "color":"red","with": [{"text": "lockdown:items/upgrade/apply/__durability","color":"gray","underlined": true}]}
execute at @e[tag=lockdown.context,limit=1] run particle minecraft:happy_villager ~ ~ ~ 0.25 0.25 0.25 0.1 10

return 0
