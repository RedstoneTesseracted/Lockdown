# Used by flag_anomaly to note an entity's position to investigate
# This is run BY the entity producing the anomaly

data modify storage lockdown:temp suspect_pos set value {x: 0, y: 0, z: 0}
data modify storage lockdown:temp suspect_pos.x set from entity @s Pos[0]
data modify storage lockdown:temp suspect_pos.y set from entity @s Pos[1]
data modify storage lockdown:temp suspect_pos.z set from entity @s Pos[2]
