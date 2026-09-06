# This function performs a raycast that damages everything near the beam

# Beam charge is needed for extra effects
execute on passengers if entity @s[tag=lockdown.laser_cannon.beam] run scoreboard players operation lockdown.cannon.charge lockdown.local = @s lockdown.cannon.charge
data modify storage lockdown:temp beam_args set value {damage_radius: 0.0, minus_damage_radius: 0.0, damage: 0.0}
# Beam radius = charge / 4
execute store result storage lockdown:temp beam_args.damage_radius float 0.25 run scoreboard players get lockdown.cannon.charge lockdown.local
execute store result storage lockdown:temp beam_args.minus_half_damage_radius float -0.125 run scoreboard players get lockdown.cannon.charge lockdown.local
# Beam damage = charge * 0.75 (+5 bonus if fully charged)
scoreboard players operation lockdown.cannon.damage lockdown.local = lockdown.cannon.charge lockdown.local
execute if score lockdown.cannon.charge lockdown.local >= lockdown.cannon_max_charge lockdown.constant run scoreboard players add lockdown.cannon.damage lockdown.local 8
execute store result storage lockdown:temp beam_args.damage float 0.75 run scoreboard players get lockdown.cannon.damage lockdown.local
execute if score lockdown.cannon.charge lockdown.local matches ..1 run data modify storage lockdown:temp beam_args.damage set value 1.0

#tellraw @a {storage: "lockdown:temp", nbt: "beam_args"}

# Add context tag to player for damage source
tag @a[tag=lockdown.context] remove lockdown.context
execute on passengers if entity @s[tag=lockdown.laser_cannon.seat] on passengers run tag @s add lockdown.context

# Set up and run raycast
scoreboard players set lockdown.distance lockdown.local 0

data modify storage lockdown:temp args set value {azimuth: 0.0, pitch: 0.0}
execute store result storage lockdown:temp args.azimuth float 0.01 run scoreboard players get @s lockdown.azimuth
execute store result storage lockdown:temp args.pitch float 0.01 run scoreboard players get @s lockdown.pitch
execute store result score lockdown.macro_result lockdown.local run function lockdown:devices/laser_cannon/fire/__damage_raycast with storage lockdown:temp args
execute unless score lockdown.macro_result lockdown.local matches 1 run tellraw @p {translate: "lockdown.messages.bug.macro.generic", color: "red", with: [{text: "lockdown:devices/laser_cannon/fire/__damage_raycast", color:"gray", underlined: true}]}

# Clear state tags
tag @e[tag=lockdown.cannon.already_hit] remove lockdown.cannon.already_hit
tag @a[tag=lockdown.context] remove lockdown.context
