# This function returns whether the hitbox entity has been attacked by anything
execute on vehicle if data entity @s {HurtTime: 10s} on attacker run return 1
return 0
