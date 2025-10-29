# This function shows information about the Lockdown data pack

# Show text
tellraw @s {translate: "lockdown.info.header", fallback: "Lockdown Pack Information:", color: "aqua", underlined: true, bold: false}
tellraw @s ""
tellraw @s {translate: "lockdown.info.resource_pack", fallback: "Resource Pack: %s", color: "green", with: [{translate: "lockdown.info.resource_pack.enabled", fallback: "Disabled", color: "aqua"}]}
execute if score lockdown.pack_version.minor lockdown.constant matches 0 run tellraw @s {translate: "lockdown.info.version", color: "green", with: [[{text: "R", color: "aqua"}, {score: {name: "lockdown.pack_version.major", objective: "lockdown.constant"}, color: "aqua"}]]}
execute if score lockdown.pack_version.minor lockdown.constant matches 1.. run tellraw @s {translate: "lockdown.info.version", color: "green", with: [[{text: "R", color: "aqua"}, {score: {name: "lockdown.pack_version.major", objective: "lockdown.constant"}, color: "aqua"}, {text: ".", color: "aqua"}, {score: {name: "lockdown.pack_version.minor", objective: "lockdown.constant"}, color: "aqua"}]]}
tellraw @s ""

# Reset trigger
scoreboard players reset @s lockdown.show_info
scoreboard players enable @s lockdown.show_info
advancement revoke @s only lockdown:hidden/show_info
