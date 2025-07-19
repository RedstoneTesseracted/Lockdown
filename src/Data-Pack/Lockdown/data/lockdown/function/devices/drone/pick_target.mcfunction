# This function handles picking a new target for the drone.
# This is run BY and AT the base drone entity.
#
# The actual logic is handled in lockdown:devices/drone/pick_target/pick.
# This function simply branches between the drone having/not having a control
# tower upgrade.
#
# When a control tower upgrade is present: candidates are picked using a radius around
# the control tower
#
# When a control tower upgrade is NOT present: candidates are picked using a radius
# around the drone

# Case 1: No control tower
execute unless entity @s[tag=lockdown.behavior.control_tower] run return run function lockdown:devices/drone/pick_target/pick

# Case 2: Has control tower
# Set up arguments for particle command
data modify storage lockdown:temp args.x set from entity @s Pos[0]
data modify storage lockdown:temp args.y set from entity @s Pos[1]
data modify storage lockdown:temp args.z set from entity @s Pos[2]

# Run AT nearest control tower with a matching channel
# Report the existence of a bug if the function macro in "pick_at_tower" fails to compile
execute store result storage lockdown:temp args.channel int 1 run scoreboard players get @s lockdown.channel
execute store result score lockdown.macro_status lockdown.local run function lockdown:devices/drone/pick_target/pick_at_tower with storage lockdown:temp args
execute unless score lockdown.macro_status lockdown.local matches 1 run title @p actionbar {translate: "lockdown.messages.bug.macro.generic",color: "red",with: [{text:"lockdown:devices/drone/pick_target/pick_at_tower",color: "gray", underlined: true}]}
