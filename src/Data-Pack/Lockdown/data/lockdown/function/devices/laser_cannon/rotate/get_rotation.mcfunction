# This function stores the rotation of the entity that ran it as scores.
# It is used by lockdown:devices/laser_cannon/rotate to get the rider's rotation.

execute store result score lockdown.azimuth lockdown.local run data get entity @s Rotation[0] 100.0
execute store result score lockdown.pitch lockdown.local run data get entity @s Rotation[1] 100.0
