# Common projectile destruction function run by any part of the projectile

# say destroyed

tag @s add lockdown.not_yet
execute on vehicle on passengers run kill @s[tag=!lockdown.not_yet,tag=lockdown.projectile]
execute on vehicle run kill @s[tag=lockdown.projectile]
execute on passengers run kill @s[tag=lockdown.projectile]
kill @s[tag=lockdown.projectile]
