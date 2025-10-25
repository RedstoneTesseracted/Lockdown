# This is used to distract the drone from targeting the last attacker instead of the intended target.
# It works by making the last attacker an impossible entity (itself)

attribute @s minecraft:knockback_resistance modifier add lockdown:temporary_knockback_resistance -1.0 add_multiplied_base
damage @s 0.0 lockdown:generic_laser by @s
attribute @s minecraft:knockback_resistance modifier remove lockdown:temporary_knockback_resistance
data modify entity @s HurtTime set value 0s
