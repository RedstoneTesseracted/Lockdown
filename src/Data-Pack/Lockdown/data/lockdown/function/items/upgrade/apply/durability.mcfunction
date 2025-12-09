# This function applies the durability upgrade to a turret/drone

# Check if chosen entity is applicable for this upgrade
execute unless function lockdown:items/upgrade/checks/target_is_turret_or_drone run return run title @p[tag=lockdown.player_context] actionbar {translate: "lockdown.messages.upgrade.not_eligible",color: "red", with: [{translate: "item.lockdown.upgrade.durability"}]}
execute if function lockdown:items/upgrade/checks/max_durability_upgrades run return run title @p[tag=lockdown.player_context] actionbar {translate: "lockdown.messages.upgrade.max_upgraded",color: "red", with: [{translate: "item.lockdown.upgrade.durability"}]}

# Apply upgrade to chosen entity
# Note: context is ALWAYS the root block entity
# Therefore, we need to shift execution to whoever the hitbox
# is in order to apply the health bonus.  Here, I've accounted
# for cases where:
#   * Hitbox is riding a passenger of the context
#   * Hitbox is riding the context
#   * Hitbox is the context
#   * Context is riding the hitbox
#   * Context is riding a passenger of the hitbox
scoreboard players add @s lockdown.upgrades.durability 1
execute store result storage lockdown:temp args.health float 3.0 run scoreboard players get @s lockdown.upgrades.durability

execute on passengers on passengers if entity @s[tag=lockdown.block.hitbox] store result score lockdown.macro_status lockdown.local run function lockdown:items/upgrade/apply/durability_macro
execute on passengers if entity @s[tag=lockdown.block.hitbox] store result score lockdown.macro_status lockdown.local run function lockdown:items/upgrade/apply/durability_macro
execute on passengers if entity @s[tag=lockdown.block.hitbox] store result score lockdown.macro_status lockdown.local run function lockdown:items/upgrade/apply/durability_macro
execute on vehicle if entity @s[tag=lockdown.block.hitbox] store result score lockdown.macro_status lockdown.local run function lockdown:items/upgrade/apply/durability_macro
execute on vehicle on vehicle if entity @s[tag=lockdown.block.hitbox] store result score lockdown.macro_status lockdown.local run function lockdown:items/upgrade/apply/durability_macro

execute at @s run particle minecraft:happy_villager ~ ~ ~ 0.25 0.25 0.25 0.1 10

return 0
