# Lookup table used to determine how much to scale motion compensation based on distance
# These are obtained using the formula:
#   multiplier = distance / projectile velocity * precision factor
#   
#   Where velocity = 0.75 b/t (set in lockdown:devices/drone/fire/summon_laser)
#         precision factor = 10
#
# Since this is a lookup table, we use a bin's midpoint as the distance (except for the last one)

execute if predicate lockdown:ranges/0-3 run return 20
execute if predicate lockdown:ranges/3-6 run return 60
execute if predicate lockdown:ranges/6-9 run return 100
execute if predicate lockdown:ranges/9-12 run return 140
execute if predicate lockdown:ranges/12-15 run return 180
execute if predicate lockdown:ranges/15-18 run return 220
execute if predicate lockdown:ranges/18-21 run return 260
execute if predicate lockdown:ranges/21-24 run return 300
execute if predicate lockdown:ranges/24-27 run return 340
execute if predicate lockdown:ranges/27-30 run return 380
execute if predicate lockdown:ranges/30- run return 400
