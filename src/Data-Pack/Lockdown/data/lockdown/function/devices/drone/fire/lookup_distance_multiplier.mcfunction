# Lookup table used to determine how much to scale motion compensation based on distance
# These are obtained using the formula:
#   multiplier = distance / projectile velocity * precision factor
#   
#   Where velocity = 0.75 b/t (set in lockdown:devices/drone/fire/summon_laser)
#         precision factor = 10
#
# Since this is a lookup table, we use a bin's midpoint as the distance (except for the last one)

execute if predicate lockdown:ranges/0-2 run return 13
execute if predicate lockdown:ranges/2-4 run return 40
execute if predicate lockdown:ranges/4-6 run return 67
execute if predicate lockdown:ranges/6-8 run return 93
execute if predicate lockdown:ranges/8-10 run return 120
execute if predicate lockdown:ranges/10-12 run return 147
execute if predicate lockdown:ranges/12-14 run return 173
execute if predicate lockdown:ranges/14-16 run return 200
execute if predicate lockdown:ranges/16-18 run return 227
execute if predicate lockdown:ranges/18-20 run return 253
execute if predicate lockdown:ranges/20-22 run return 280
execute if predicate lockdown:ranges/22-24 run return 307
execute if predicate lockdown:ranges/24-26 run return 333
execute if predicate lockdown:ranges/26-28 run return 360
execute if predicate lockdown:ranges/28-30 run return 387
execute if predicate lockdown:ranges/30- run return 400
