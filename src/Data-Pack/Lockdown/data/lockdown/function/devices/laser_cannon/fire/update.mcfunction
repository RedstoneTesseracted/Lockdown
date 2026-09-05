# Progress the charge counter if the player is holding down "space".
# This is run BY and AT the root cannon entity

# Check whether pilot is charging cannon
execute store result score lockdown.result lockdown.local run function lockdown:devices/laser_cannon/fire/passenger_is_charging

# Progress charging
execute if score lockdown.result lockdown.local matches 1 run function lockdown:devices/laser_cannon/fire/charge

# Release charge
execute if score lockdown.result lockdown.local matches 0 if score @s lockdown.cannon.charge matches 1.. run function lockdown:devices/laser_cannon/fire/release

# Update progress bar
data modify storage lockdown:temp args set value {id: 0}
execute on passengers if entity @s[tag=lockdown.laser_cannon.seat] on passengers store result storage lockdown:temp args.id int 1 run scoreboard players get @s lockdown.player_id
execute store result score lockdown.macro_result lockdown.local run function lockdown:devices/laser_cannon/fire/__update with storage lockdown:temp args
execute unless score lockdown.macro_result lockdown.local matches 1 run tellraw @p {translate: "lockdown.messages.bug.macro.generic", color: "red", with: [{text: "lockdown:devices/laser_cannon/fire/__update", color:"gray", underlined: true}]}
