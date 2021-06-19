# This is the root function for all upgrades in item form.

execute if entity @s[type=item,nbt={Item:{tag:{LockdownData:{upgrade_id:1}}}}] if entity @e[tag=ld_drone,distance=..1,tag=!ld_modified] run function lockdown:upgrades/drone_tower_upgrade
execute if entity @s[type=item,nbt={Item:{tag:{LockdownData:{upgrade_id:2}}}}] if entity @e[tag=ld_drone,distance=..1,tag=!ld_modified] run function lockdown:upgrades/durability_upgrade_drone
execute if entity @s[type=item,nbt={Item:{tag:{LockdownData:{upgrade_id:3}}}}] if entity @e[tag=ld_drone,distance=..1,tag=!ld_modified] run function lockdown:upgrades/flamethrower_upgrade_drone
execute if entity @s[type=item,nbt={Item:{tag:{LockdownData:{upgrade_id:4}}}}] if entity @e[tag=ld_drone,distance=..1,tag=!ld_modified] run function lockdown:upgrades/range_upgrade_drone

execute if entity @s[type=item,nbt={Item:{tag:{LockdownData:{upgrade_id:2}}}}] if entity @e[tag=ld_turret,distance=..1,tag=!ld_modified] run function lockdown:upgrades/durability_upgrade_turret
execute if entity @s[type=item,nbt={Item:{tag:{LockdownData:{upgrade_id:3}}}}] if entity @e[tag=ld_turret,distance=..1,tag=!ld_modified] run function lockdown:upgrades/flamethrower_upgrade_turret
execute if entity @s[type=item,nbt={Item:{tag:{LockdownData:{upgrade_id:4}}}}] if entity @e[tag=ld_turret,distance=..1,tag=!ld_modified] run function lockdown:upgrades/range_upgrade_turret
