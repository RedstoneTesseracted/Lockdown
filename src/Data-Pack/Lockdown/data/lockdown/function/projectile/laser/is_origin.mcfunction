# Used by lockdown:projectile/laser/exclude_origin to shift execution to candidate collided entities

execute store result score lockdown.uuid1 lockdown.local run data get entity @s UUID[0]
execute store result score lockdown.uuid2 lockdown.local run data get entity @s UUID[1]
execute store result score lockdown.uuid3 lockdown.local run data get entity @s UUID[2]
execute store result score lockdown.uuid4 lockdown.local run data get entity @s UUID[3]

execute \
if score lockdown.uuid1 lockdown.local = lockdown.origin_uuid1 lockdown.local \
if score lockdown.uuid2 lockdown.local = lockdown.origin_uuid2 lockdown.local \
if score lockdown.uuid3 lockdown.local = lockdown.origin_uuid3 lockdown.local \
if score lockdown.uuid4 lockdown.local = lockdown.origin_uuid4 lockdown.local \
run return 1

return 0
