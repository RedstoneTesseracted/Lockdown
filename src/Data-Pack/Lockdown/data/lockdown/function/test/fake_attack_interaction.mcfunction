# This function fakes an attack on an interaction-based hitbox.
# It is used by the destruction test for alarm lights to break said alarm
#
# This is run BY an interaction entity

# Forcibly update the "attack" field to fake an attack
data merge entity @s {attack: {timestamp: 0L, player: [I; 0, 0, 0, 0]}}
execute store result entity @s attack.timestamp long 1 run time query gametime

# Manually trigger the event handler
function lockdown:devices/hit_destroy_callback
