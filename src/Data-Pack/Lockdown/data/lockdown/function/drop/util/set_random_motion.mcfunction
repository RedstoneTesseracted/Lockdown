# This function applies a random motion to the item that ran it
# in order to mimic what Minecraft does normally from dropped items
#
# A brief experiment indicates the following rules for motion:
#   * X and Z components set to a random value between [-0.1, 0.1]
#   * Y-component always set to 0.2
#

execute store result entity @s Motion[0] double 0.0001 run random value -1000..1000
data modify entity @s Motion[1] set value 0.2d
execute store result entity @s Motion[2] double 0.0001 run random value -1000..1000
