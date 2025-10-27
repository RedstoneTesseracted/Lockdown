# Common function that returns a direction score based on the cardinal direction of the source
#
# 2=north
# 3=south
# 4=west
# 5=east

scoreboard players set lockdown.direction lockdown.local 2
execute as @a[limit=1,tag=lockdown.placer.source,y_rotation=135..-135] run return 2
execute as @a[limit=1,tag=lockdown.placer.source,y_rotation=-45..45] run return 3
execute as @a[limit=1,tag=lockdown.placer.source,y_rotation=45..135] run return 4
execute as @a[limit=1,tag=lockdown.placer.source,y_rotation=-135..-45] run return 5

# Default value
return 2
